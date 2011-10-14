class Spree::BaseController < ActionController::Base
  include SpreeBase
  include SpreeRespondWith
  
  before_filter :populate_taxons
      
      def populate_taxons
          #put taxons names in scope to generate filter options
          #@finishes = Taxonomy.find_by_name("Finish").taxons.collect{|t| t.name}.sort
          #@sizes = Taxonomy.find_by_name("Size").taxons.collect{|t| t.name}.sort
          #@brands = Taxonomy.find_by_name("Brand").taxons.collect{|t| t.name}.sort
          
          #@types = Taxonomy.find_by_name("Type").taxons.collect{|t| 
          #  unless t.parent_id == nil
          #    t.name
          #  end
          #}
          #@types.delete_if {|x| x == nil}
          #@types.sort!
          
          @types = Taxonomy.find_by_name("Type").taxons.sort! { |a,b| a.name.downcase <=> b.name.downcase }
          
          #@brands = Taxonomy.find_by_name("Brand").taxons.collect{|t| 
          #  unless t.parent_id == nil
          #      t.name
          #  end
          #}
          #@brands.delete_if {|x| x == nil}
          #@brands.sort!
          
          @brands = Taxonomy.find_by_name("Brand").taxons.sort! { |a,b| a.name.downcase <=> b.name.downcase }
          
          @sizes = Taxonomy.find_by_name("Size").taxons.collect{|t| 
            unless t.parent_id == nil
              t.name
            end
          }
          @sizes.delete_if {|x| x == nil}
          
          @sizes.sort!
          
          @finishes = Taxonomy.find_by_name("Color Group").taxons.collect{|t| 
            unless t.parent_id == nil
              t.name
            end
          }
          @finishes.delete_if {|x| x == nil}
        @finishes.sort!
  end
end
