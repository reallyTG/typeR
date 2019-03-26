library(ERP)


### Name: nbfactors
### Title: Determination of the number of factors in high dimensional
###   factor models.
### Aliases: nbfactors

### ** Examples

data(impulsivity)
erpdta = as.matrix(impulsivity[,5:505])   # erpdta contains the whole set of ERP curves   
nbf = nbfactors(scale(erpdta),maxnbfactors=10,diagnostic.plot=TRUE)  



