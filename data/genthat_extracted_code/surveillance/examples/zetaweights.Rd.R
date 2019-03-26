library(surveillance)


### Name: zetaweights
### Title: Power-Law Weights According to Neighbourhood Order
### Aliases: zetaweights
### Keywords: spatial utilities

### ** Examples

nbmat <- matrix(c(0,1,2,2,
                  1,0,1,1,
                  2,1,0,2,
                  2,1,2,0), 4, 4, byrow=TRUE)
zetaweights(nbmat, d=1, normalize=FALSE) # harmonic: o^-1
zetaweights(nbmat, d=1, normalize=TRUE)  # rowSums=1
zetaweights(nbmat, maxlag=1, normalize=FALSE) # results in adjacency matrix



