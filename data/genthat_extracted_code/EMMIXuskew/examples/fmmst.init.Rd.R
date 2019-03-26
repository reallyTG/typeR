library(EMMIXuskew)


### Name: fmmst.init
### Title: Initialization for Fitting Finite Mixtures of Unrestricted
###   Multivariate Skew t Distributions
### Aliases: fmmst.init
### Keywords: EM algorithm multivariate skew t maximum likelihood
###   estimation

### ** Examples

#a short demo using AIS data
data(ais)
Fit.init <- fmmst.init(2, ais[,c(2,12)])  

#the number of available initializations
length(Fit.init)  

#getting the first set of available initialization
Fit.init[[1]]     
## Not run: 
##D Fit1 <- fmmst(2, ais[,c(2,12)], initial=Fit.init[[1]])
##D Fit2 <- fmmst(2, ais[,c(2,12)], initial=Fit.init[[2]])
## End(Not run)



