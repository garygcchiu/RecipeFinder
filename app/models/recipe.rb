class Recipe < ApplicationRecord

  include HTTParty
  ENV["FOOD2FORK_KEY"] = '2928b993aba6935d065264a8ec51dd6b'
  base_uri 'http://food2fork.com/api'
  default_params key: ENV["FOOD2FORK_KEY"]
  format :json

   def self.for term
     get("/search", query: { q: term})["recipes"]
   end

   def self.search(search)
     if search
        find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
     else
        find(:all)
     end
   end

end
