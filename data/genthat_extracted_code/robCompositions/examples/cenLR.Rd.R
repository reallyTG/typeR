library(robCompositions)


### Name: cenLR
### Title: Centred log-ratio transformation
### Aliases: cenLR
### Keywords: manip

### ** Examples


data(expenditures)
eclr <- cenLR(expenditures)
inveclr <- cenLRinv(eclr)
head(expenditures)
head(inveclr)
head(pivotCoordInv(eclr$x.clr))




