library(facilitation)


### Name: twospecies
### Title: A simulation result with two very different species
### Aliases: twospecies
### Keywords: datasets

### ** Examples

### Two species competition with growth limitation
nstages <- c(3,2)
init <- list(c(100,0,10),c(100,30))
param1 <- create.parameters(D=c(1,2,.5),G=c(1,1),R=10,dispersal=30,radius=c(0,.5,3))
param2 <- create.parameters(D=c(1,.5),G=c(1),R=4,dispersal=5,radius=c(1,5))
param  <- rbind(param1,param2)
interD <- matrix(c(0,0,0,0,0, 0,-1,0,0,0, 0,0,-2,0,-1, 0,0,-1,0,0, 0,0,-1,0,-2),ncol=5)
interG <- matrix(c(0,0,0,0,-.5, 0,0,0,0,-.5, 0,0,0,0,0, 0,0,0,0,-.8, 0,0,0,0,0),ncol=5)
twospecies <- community(10,nstages,param,init,interactionsD=interD,interactionsG=interG)



