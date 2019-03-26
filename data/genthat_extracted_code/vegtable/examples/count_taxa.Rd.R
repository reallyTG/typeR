library(vegtable)


### Name: count_taxa
### Title: Count taxa within a taxlist object
### Aliases: count_taxa count_taxa,vegtable-method
###   count_taxa,formula-method
### Keywords: methods

### ** Examples

library(vegtable)

## Different alternatives
count_taxa(Kenya_veg)
head(count_taxa(~ ReleveID, Kenya_veg))
head(count_taxa(species ~ ReleveID, Kenya_veg))
head(count_taxa(species ~ ReleveID, Kenya_veg, TRUE))
head(count_taxa(family ~ ReleveID, Kenya_veg, TRUE))



