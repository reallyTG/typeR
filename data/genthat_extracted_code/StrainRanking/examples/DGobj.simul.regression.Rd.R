library(StrainRanking)


### Name: DGobj.simul.regression
### Title: Simulation of a DG object under a regression model
### Aliases: DGobj.simul.regression
### Keywords: datagen

### ** Examples

## Simulation of a data set
DGreg=DGobj.simul.regression(sqrtn=10, size1=30, size2=10, theta=c(1.5,2,3), 
	alpha.function=generation.alpha.3strains, sigma=0.1)
summary(DGreg)

## Simulation of a data set and plots of the proportions in space the strains
DGreg=DGobj.simul.regression(sqrtn=10, size1=30, size2=10, theta=c(1.5,2,3), 
	alpha.function=generation.alpha.3strains, sigma=0.1,plots=TRUE)
summary(DGreg)



