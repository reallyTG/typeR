library(spaMM)


### Name: CauchyCorr
### Title: Cauchy correlation function and Cauchy formula term
### Aliases: CauchyCorr Cauchy
### Keywords: models spatial

### ** Examples

data("blackcap")
HLCor(migStatus ~ means+ Cauchy(1|latitude+longitude),data=blackcap,
      HLmethod="ML",ranPars=list(longdep=0.5,shape=0.5,rho=0.05))
## The Cauchy family can be used in Euclidean spaces of any dimension:
set.seed(123)
randpts <- matrix(rnorm(20),nrow=5)
distMatrix <- as.matrix(proxy::dist(randpts))
CauchyCorr(distMatrix,rho=0.1,shape=1,longdep=10)



