library(steadyICA)


### Name: multidcov
### Title: Symmetric multivariate distance covariance
### Aliases: multidcov
### Keywords: distance covariance dcov

### ** Examples

nObs <- 1024
nComp <- 3

simM <- matrix(rnorm(nComp*nComp),nComp)

# simulate some data:
simS<-cbind(rgamma(nObs, shape = 1, scale = 2),
            rgamma(nObs, shape = 3, scale = 2),
            rgamma(nObs, shape = 9, scale = 0.5))


simS <- scale(simS) #Standardize variance for identifiability

#mix the sources:
xData <- simS %*% simM

multidcov(simS) #close to zero
multidcov(whitener(xData)$Z) #should be larger than simS
multidcov(xData) #greater than zero



