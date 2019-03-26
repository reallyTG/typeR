library(spaMM)


### Name: MaternCorr
### Title: Matern correlation function and Matern formula term.
### Aliases: Matern MaternCorr MaternCorr.default
### Keywords: models spatial

### ** Examples

## See examples in help("spaMM"), help("HLCor"), help("Loaloa"), etc.
## The Matérn family can be used in Euclidean spaces of any dimension:
set.seed(123)
randpts <- matrix(rnorm(20),nrow=5)
distMatrix <- as.matrix(proxy::dist(randpts))
MaternCorr(distMatrix,nu=2)



