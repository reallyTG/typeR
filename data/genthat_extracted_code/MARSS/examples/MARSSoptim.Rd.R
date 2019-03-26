library(MARSS)


### Name: MARSSoptim
### Title: Parameter estimation for MARSS models using optim
### Aliases: MARSSoptim

### ** Examples

dat <- t(harborSealWA)
dat <- dat[2:4,] #remove the year row

#fit a model with EM and then use that fit as the start for BFGS
#fit a model with 1 hidden state where obs errors are iid
#R="diagonal and equal" is the default so not specified
#Q is fixed
kemfit <- MARSS(dat, model=list(Z=matrix(1,3,1),Q=matrix(.01)))
bfgsfit <- MARSS(dat, model=list(Z=matrix(1,3,1),Q=matrix(.01)), 
   inits=coef(kemfit,form="marss"), method="BFGS")



