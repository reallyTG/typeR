library(StrainRanking)


### Name: DGobj.simul.mechanistic
### Title: Simulation of a DG object under a mechanistic model
### Aliases: DGobj.simul.mechanistic
### Keywords: datagen

### ** Examples

## Simulation of a data set
DGmech=DGobj.simul.mechanistic(sqrtn=10, size1=30, size2=10, theta=c(1.5,2,3), 
	beta=c(5,5), M=7, delta=0.2)
summary(DGmech)

## Simulation of a data set and plots of the sub-epidemics for the strains and their
## proportions in space at the final time step
DGmech=DGobj.simul.mechanistic(sqrtn=10, size1=30, size2=10, theta=c(1.5,2,3), 
	beta=c(5,5), M=7, delta=0.2, plots=TRUE)
summary(DGmech)



