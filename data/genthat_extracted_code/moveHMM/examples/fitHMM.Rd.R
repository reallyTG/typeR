library(moveHMM)


### Name: fitHMM
### Title: Fit an HMM to the data
### Aliases: fitHMM

### ** Examples

### 1. simulate data
# define all the arguments of simData
nbAnimals <- 2
nbStates <- 2
nbCovs <- 2
mu<-c(15,50)
sigma<-c(10,20)
angleMean <- c(pi,0)
kappa <- c(0.7,1.5)
stepPar <- c(mu,sigma)
anglePar <- c(angleMean,kappa)
stepDist <- "gamma"
angleDist <- "vm"
zeroInflation <- FALSE
obsPerAnimal <- c(50,100)

data <- simData(nbAnimals=nbAnimals,nbStates=nbStates,stepDist=stepDist,angleDist=angleDist,
                 stepPar=stepPar,anglePar=anglePar,nbCovs=nbCovs,zeroInflation=zeroInflation,
                 obsPerAnimal=obsPerAnimal)

### 2. fit the model to the simulated data
# define initial values for the parameters
mu0 <- c(20,70)
sigma0 <- c(10,30)
kappa0 <- c(1,1)
stepPar0 <- c(mu0,sigma0) # no zero-inflation, so no zero-mass included
anglePar0 <- kappa0 # the angle mean is not estimated, so only the concentration parameter is needed
formula <- ~cov1+cos(cov2)

m <- fitHMM(data=data,nbStates=nbStates,stepPar0=stepPar0,anglePar0=anglePar0,formula=formula,
              stepDist=stepDist,angleDist=angleDist,angleMean=angleMean)

print(m)




