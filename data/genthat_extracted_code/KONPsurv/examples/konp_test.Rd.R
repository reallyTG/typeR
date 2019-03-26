library(KONPsurv)


### Name: konp_test
### Title: KONP tests are K-sample Omnibus Non-Proportional hazards tests
###   for right-censored data.
### Aliases: konp_test

### ** Examples

## Generate some data to preform the test
set.seed(1)
n <- 50
time <- rexp(n)
status <- sample(c(0,1),n,TRUE)
group <- c(rep(1,25),rep(2,25))

konp_test(time,status,group,n_perm=10^3)




