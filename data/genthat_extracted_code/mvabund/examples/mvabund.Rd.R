library(mvabund)


### Name: mvabund
### Title: Multivariate Abundance Data Objects
### Aliases: mvabund as.mvabund is.mvabund mvabund-class
### Keywords: classes multivariate

### ** Examples

data(solberg) 

## Create an mvabund object:
solbergdat <- mvabund(solberg$abund)

## Turn solberg$abund into an mvabund object and store as solbergdat:
solbergdat <- as.mvabund(solberg$abund)

## Check if solbergdat  is an mvabund object:
is.mvabund(solbergdat)



