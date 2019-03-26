library(lmmen)


### Name: init.beta
### Title: Evaluate fixed effects initial values for lmmen
### Aliases: init.beta

### ** Examples

 dat <- initialize_example(n.i = 5,n = 30,q=4,seed=1)
 init.beta(dat,method='glmnet')
 init.beta(dat,method='lme4')



