library(BayesVarSel)


### Name: Jointness
### Title: Computation of Jointness measurements.
### Aliases: Jointness
### Keywords: package

### ** Examples


## Not run: 
##D #Analysis of Crime Data
##D #load data
##D 
##D data(UScrime)
##D 
##D crime.Bvs<- Bvs(formula= y ~ ., data=UScrime, n.keep=1000)
##D 
##D #A look at the jointness measurements:
##D Jointness(crime.Bvs, covariates="All")
##D 
##D Jointness(crime.Bvs, covariates=c("Ineq","Prob"))
##D #---------
##D #The joint inclusion probability for Ineq and Prob is:  0.65
##D #---------
##D #The ratio between the probability of including both
##D #covariates and the probability of including at least one of then is: 0.66
##D #---------
##D #The probability of including both covariates at the same times is 1.95 times
##D #the probability of including one of them alone
##D 
## End(Not run)



