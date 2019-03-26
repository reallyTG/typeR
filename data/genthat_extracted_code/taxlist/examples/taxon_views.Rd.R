library(taxlist)


### Name: taxon_views
### Title: Management of concept views in taxonomic lists.
### Aliases: taxon_views taxon_views,taxlist-method taxon_views<-
###   taxon_views<-,taxlist,data.frame-method add_view
###   add_view,taxlist-method replace_view
###   replace_view,taxlist,numeric,numeric-method
### Keywords: methods

### ** Examples

library(taxlist)
data(Easplist)

## See existing views
taxon_views(Easplist)

## Add a new view
Easplist <- add_view(Easplist, secundum="Beentje et al. (1952)",
	Title="Flora of Tropical East Africa",
	URL="http://www.kew.org/science/directory/projects/FloraTropEAfrica.html")

taxon_views(Easplist)



