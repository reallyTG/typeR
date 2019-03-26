library(taxlist)


### Name: taxon_names
### Title: Handle Information on Taxon Usage Names
### Aliases: taxon_names taxon_names,taxlist-method taxon_names<-
###   taxon_names<-,taxlist,data.frame-method add_synonym
###   add_synonym,taxlist-method update_name
###   update_name,taxlist,numeric-method delete_name
###   delete_name,taxlist,numeric-method
### Keywords: methods

### ** Examples

library(taxlist)
data(Easplist)

## Display of slot 'taxonNames'
Euclea <- subset(Easplist, charmatch("Euclea", TaxonName), slot="names",
	keep_children=TRUE)
summary(Euclea)
taxon_names(Euclea)

## Insert a synonym to Diospyros scabra
summary(Easplist, "Diospyros scabra")
Easplist <- add_synonym(Easplist, 51793, TaxonName="Maba scabra",
	AuthorName="Chiov.")
summary(Easplist, "Diospyros scabra")

## Delete a synonym of Launaea cornuta
summary(Easplist, "Launaea cornuta")
Easplist <- delete_name(Easplist, 53821)
summary(Easplist, "Launaea cornuta")



