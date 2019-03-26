library(moveHMM)


### Name: allProbs
### Title: Matrix of all probabilities
### Aliases: allProbs

### ** Examples

## Not run: 
##D stepPar <- c(1,10,1,5,0.2,0.3)
##D anglePar <- c(0,pi,0.5,2)
##D stepDist <- "gamma"
##D angleDist <- "vm"
##D data <- simData(nbAnimals=5,nbStates=2,stepDist=stepDist,angleDist=angleDist,stepPar=stepPar,
##D                  anglePar=anglePar,nbCovs=2,zeroInflation=TRUE)
##D P <- allProbs(data=data,nbStates=2,stepDist=stepDist,angleDist=angleDist,
##D                stepPar=matrix(stepPar,ncol=2,byrow=TRUE),anglePar=matrix(anglePar,ncol=2,
##D                byrow=TRUE),zeroInflation=TRUE)
## End(Not run)



