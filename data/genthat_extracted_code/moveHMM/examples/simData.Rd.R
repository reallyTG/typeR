library(moveHMM)


### Name: simData
### Title: Simulation tool
### Aliases: simData

### ** Examples

# 1. Pass a fitted model to simulate from
# (m is a moveHMM object - as returned by fitHMM - automatically loaded with the package)
# We keep the default nbAnimals=1.
m <- example$m
obsPerAnimal=c(50,100)
data <- simData(model=m,obsPerAnimal=obsPerAnimal)

# 2. Pass the parameters of the model to simulate from
stepPar <- c(1,10,1,5,0.2,0.3) # mean1, mean2, sd1, sd2, z1, z2
anglePar <- c(pi,0,0.5,2) # mean1, mean2, k1, k2
stepDist <- "gamma"
angleDist <- "vm"
data <- simData(nbAnimals=5,nbStates=2,stepDist=stepDist,angleDist=angleDist,stepPar=stepPar,
               anglePar=anglePar,nbCovs=2,zeroInflation=TRUE,obsPerAnimal=obsPerAnimal)

stepPar <- c(1,10,1,5) # mean1, mean2, sd1, sd2
anglePar <- c(pi,0,0.5,0.7) # mean1, mean2, k1, k2
stepDist <- "weibull"
angleDist <- "wrpcauchy"
data <- simData(nbAnimals=5,nbStates=2,stepDist=stepDist,angleDist=angleDist,stepPar=stepPar,
               anglePar=anglePar,obsPerAnimal=obsPerAnimal)

# step length only and zero-inflation
stepPar <- c(1,10,1,5,0.2,0.3) # mean1, mean2, sd1, sd2, z1, z2
stepDist <- "gamma"
data <- simData(nbAnimals=5,nbStates=2,stepDist=stepDist,angleDist="none",stepPar=stepPar,
               nbCovs=2,zeroInflation=TRUE,obsPerAnimal=obsPerAnimal)

# include covariates
# (note that it is useless to specify "nbCovs", which is determined
# by the number of columns of "cov")
cov <- data.frame(temp=rnorm(500,20,5))
stepPar <- c(1,10,1,5) # mean1, mean2, sd1, sd2
anglePar <- c(pi,0,0.5,2) # mean1, mean2, k1, k2
stepDist <- "gamma"
angleDist <- "vm"
data <- simData(nbAnimals=5,nbStates=2,stepDist=stepDist,angleDist=angleDist,stepPar=stepPar,
                anglePar=anglePar,covs=cov)




