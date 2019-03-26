library(cluster)


### Name: pluton
### Title: Isotopic Composition Plutonium Batches
### Aliases: pluton
### Keywords: datasets

### ** Examples

data(pluton)

hist(apply(pluton,1,sum), col = "gray") # between 94% and 100%
pu5 <- pluton
pu5$Pu242 <- 100 - apply(pluton,1,sum) # the remaining isotope.
pairs(pu5)



