library(vegtable)


### Name: merge_taxa
### Title: Merge concepts.
### Aliases: merge_taxa merge_taxa,vegtable,numeric,missing-method
###   merge_taxa,vegtable,missing,character-method taxa2samples
###   taxa2samples,vegtable-method
### Keywords: methods

### ** Examples

library(vegtable)
data(Kenya_veg)

## Merge Olea capensis into one
summary(subset(Kenya_veg@species, grepl("Olea capensis", TaxonName),
	slot="names"), "all")
Kenya_veg <- merge_taxa(Kenya_veg, c(52041,50432,50235))

## Check Olea capensis again
summary(subset(Kenya_veg@species, grepl("Olea capensis", TaxonName),
	slot="names"), "all")

## Effect of taxa2samples by counting taxa
count_taxa(Kenya_veg, level="genus")

Kenya_veg <- taxa2samples(Kenya_veg, merge_to="genus")
count_taxa(Kenya_veg, level="genus")



