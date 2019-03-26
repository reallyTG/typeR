library(NNS)


### Name: NNS.SD.efficient.set
### Title: NNS SD Efficient Set
### Aliases: NNS.SD.efficient.set
### Keywords: dominance stochastic

### ** Examples

set.seed(123)
x <- rnorm(100) ; y<-rnorm(100) ; z<-rnorm(100)
A <- cbind(x, y, z)
NNS.SD.efficient.set(A, 1)



