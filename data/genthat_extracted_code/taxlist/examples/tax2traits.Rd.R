library(taxlist)


### Name: tax2traits
### Title: Set Taxonomic Information as Taxon Traits
### Aliases: tax2traits tax2traits,taxlist-method

### ** Examples

library(taxlist)
data(Easplist)

## Family Acanthaceae with children
Easplist <- subset(Easplist, TaxonName == "Acanthaceae", slot="names",
	keep_children=TRUE)
summary(Easplist)

## Insert taxonomy to taxon traits
Easplist <- tax2traits(Easplist, get_names=TRUE)
head(taxon_traits(Easplist))



