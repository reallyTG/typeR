library(taxlist)


### Name: get_children,get_parents
### Title: Retrieve Children or Parents of Taxon Concepts
### Aliases: get_children get_children,taxlist,numeric-method
###   get_children,taxlist,taxlist-method get_parents
###   get_parents,taxlist,numeric-method get_parents,taxlist,taxlist-method
### Keywords: methods

### ** Examples

library(taxlist)
data(Easplist)

## Subset with family Ebenaceae and children
Ebenaceae <- subset(Easplist, charmatch("Ebenaceae", TaxonName))
Ebenaceae <- get_children(Easplist, Ebenaceae)

summary(Ebenaceae)
summary(Ebenaceae, "all", maxsum=100)

## Get parents of Diospyros tricolor
Diostri <- subset(Easplist, TaxonConceptID == 52403, slot="relations")
Diostri <- get_parents(Easplist, Diostri)

summary(Diostri)
summary(Diostri, "all")



