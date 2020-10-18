# require libraries/modules here

# returns a hash (FAILED - 1)
#   includes at least five projects (FAILED - 2)
#   project titles point to a hash of info (FAILED - 3)
#   each project has an image link hosted on AmazonAWS (FAILED - 4)
#   each project has a description which is a string (FAILED - 5)
#   each project has a location which is a string (FAILED - 6)
#   each project has percentage funded listed which is an integer (FAILED - 7)


# :projects => {
#   "My Great Project"  => {
#     :image_link => "Image Link",
#     :description => "Description",
#     :location => "Location",
#     :percent_funded => "Percent Funded"
#   },
#   "Another Great Project" => {
#     :image_link => "Image Link",
#     :description => "Description",
#     :location => "Location",
#     :percent_funded => "Percent Funded"
#   }
# } 
require 'nokogiri'
require 'pry'
def create_project_hash
  # write your code here
  html = File.read('fixtures/kickstarter.html')

  kickstarter = Nokogiri::HTML(html) 
  
  project_title = kickstarter.css('.bbcard_name a') 
  
  image_urls = kickstarter.css('.projectphoto-little')
  
  description = kickstarter.css('.bbcard_blurb')
  location = kickstarter.css('.location-name')
  percentage_funded = kickstarter.css('.funded strong')

  projects = {}
  5.times do |i|
    
     projects[project_title[i].text] = {
                    :image_link => image_urls[0].attr('src'),
                    :description => description[i].text,
                    :location => location[i].text,
                    :percent_funded => percentage_funded[i].text[/\d/].to_i
            }
    
  end
  projects

end

puts create_project_hash