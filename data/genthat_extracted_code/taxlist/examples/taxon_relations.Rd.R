library(taxlist)


### Name: taxon_relations
### Title: Retrieve or replace slot taxonRelations in taxlist objects
### Aliases: taxon_relations taxon_relations,taxlist-method
###   taxon_relations<- taxon_relations<-,taxlist,data.frame-method
###   add_concept add_concept,taxlist,character-method
###   add_concept,taxlist,taxlist-method update_concept
###   update_concept,taxlist,numeric-method
### Keywords: methods

### ** Examples

library(taxlist)
data(Easplist)

## Subset for the genus Euclea and display of slot 'taxonNames'
Euclea <- subset(Easplist, charmatch("Euclea", TaxonName), slot="names")
Euclea <- get_children(Easplist, Euclea)

summary(Euclea)
taxon_relations(Euclea)

## Subset with family Ebenaceae and children
Ebenaceae <- subset(Easplist, charmatch("Ebenaceae", TaxonName))
Ebenaceae <- get_children(Easplist, Ebenaceae)

summary(Ebenaceae)
summary(Ebenaceae, "all", maxsum=100)

## Adding a new concept
Ebenaceae <- add_concept(Ebenaceae, TaxonName="Euclea acutifolia",
AuthorName="E. Mey. ex A. DC.", Level="species", Parent=55707, ViewID=1)

## A summary again  
summary(Ebenaceae)
summary(Ebenaceae, "all", maxsum=100)

## Display two Typha species
summary(Easplist, c("Typha domingensis","Typha latifolia"))

## Update a concept
summary(Easplist, "Corchorus olitorius")
Easplist <- update_concept(Easplist, 155, Level="subspecies")
summary(Easplist, "Corchorus olitorius")



