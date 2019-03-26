library(RAM)


### Name: filter.Taxa
### Title: Filter Taxonomic Abundance Matrix by Total Counts Or Maximum
###   Relative Abundance
### Aliases: filter.Taxa
### Keywords: datagen

### ** Examples

data(ITS1)
g1 <- tax.abund(ITS1, rank="g", drop.unclassified=TRUE)
taxa.fil <- filter.Taxa(g1, percent=0.01)



