library(caper)


### Name: macrocaic
### Title: Comparative analysis using independent contrasts on species
###   richness data.
### Aliases: macrocaic
### Keywords: models regression

### ** Examples

data(IsaacEtAl)
primates <- comparative.data(primates.tree, primates.data, binomial, na.omit=FALSE)
primatesBodySize <- macrocaic(species.rich ~ body.mass, data=primates)
summary(primatesBodySize)




