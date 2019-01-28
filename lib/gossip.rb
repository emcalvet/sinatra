require 'csv'

class Gossip
	attr_accessor :author, :content

  def initialize(author, content)
		@author = author
	  @content = content
	end

  def save
		CSV.open("./db/gossip.csv", "ab") do |csv|
			csv << [@author, @content]
    end
	end

	def self.all
		all_gossips = []
		CSV.read("./db/gossip.csv").each do |csv_line|
			all_gossips << Gossip.new(csv_line[0], csv_line[1])
		end
		return all_gossips
	end

	def self.find(gossip_number)
		CSV.read("./db/gossip.csv").each_with_index do |csv_line, index|
			index += 1
			if gossip_number == index
				return csv_line
			end
		end
	end
end
