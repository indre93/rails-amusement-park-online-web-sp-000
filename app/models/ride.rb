class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if attraction.tickets > user.tickets && attraction.min_height > user.height
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif attraction.tickets > user.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif attraction.min_height > user.height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      update_user
      "Thanks for riding the #{attraction.name}!"
    end
  end

  def update_user
    user[:tickets] = user.tickets - attraction.tickets
    user[:nausea] = user.nausea + attraction.nausea_rating
    user[:happiness] = user.happiness + attraction.happiness_rating
    user.save
  end
  
end
