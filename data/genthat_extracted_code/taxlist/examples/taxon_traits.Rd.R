library(taxlist)


### Name: taxon_traits
### Title: Manipulation of taxon traits in taxlist objects.
### Aliases: taxon_traits taxon_traits,taxlist-method taxon_traits<-
###   taxon_traits<-,taxlist,data.frame-method update_trait
###   update_trait,taxlist,numeric-method
### Keywords: methods

### ** Examples

library(taxlist)

data(Easplist)
summary(Easplist, units="Mb")

## Get the head of slot "taxonTraits"
head(taxon_traits(Easplist))



