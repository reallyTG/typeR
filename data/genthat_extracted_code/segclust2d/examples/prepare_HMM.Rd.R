library(segclust2d)


### Name: prepare_HMM
### Title: Prepare HMM output for proper comparison plots
### Aliases: prepare_HMM

### ** Examples

## Not run: 
##D # Example taken from moveHMM package.
##D # 1. simulate data
##D # define all the arguments of simData
##D nbAnimals <- 1
##D nbStates <- 2
##D nbCovs <- 2
##D mu<-c(15,50)
##D sigma<-c(10,20)
##D angleMean <- c(pi,0)
##D kappa <- c(0.7,1.5)
##D stepPar <- c(mu,sigma)
##D anglePar <- c(angleMean,kappa)
##D stepDist <- "gamma"
##D angleDist <- "vm"
##D zeroInflation <- FALSE
##D obsPerAnimal <- c(50,100)
##D 
##D data <- moveHMM::simData(nbAnimals=nbAnimals,nbStates=nbStates,
##D                 stepDist=stepDist,angleDist=angleDist,
##D                 stepPar=stepPar,anglePar=anglePar,nbCovs=nbCovs,
##D                 zeroInflation=zeroInflation,
##D                 obsPerAnimal=obsPerAnimal)
##D 
##D ### 2. fit the model to the simulated data
##D # define initial values for the parameters
##D mu0 <- c(20,70)
##D sigma0 <- c(10,30)
##D kappa0 <- c(1,1)
##D stepPar0 <- c(mu0,sigma0) # no zero-inflation, so no zero-mass included
##D anglePar0 <- kappa0 # the angle mean is not estimated,
##D # so only the concentration parameter is needed
##D formula <- ~cov1+cos(cov2)
##D m <- moveHMM::fitHMM(data=data,nbStates=nbStates,stepPar0=stepPar0,
##D          anglePar0=anglePar0,formula=formula,
##D          stepDist=stepDist,angleDist=angleDist,angleMean=angleMean)
##D          
##D ### 3. Transform into a segmentation-class object
##D res.hmm <- prepare_HMM(data=data, hmm.model = m, diag.var = c("step","angle"))
##D ### 4. you can now apply the same function than for segclust2d outputs
##D plot(res.hmm)
##D segmap(res.hmm)
## End(Not run)



