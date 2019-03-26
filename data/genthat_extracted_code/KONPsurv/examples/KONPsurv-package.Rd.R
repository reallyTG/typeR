library(KONPsurv)


### Name: KONPsurv-package
### Title: KONP Tests for Testing the Equality of K Distributions for
###   Right-Censored Data
### Aliases: KONPsurv-package KONPsurv
### Keywords: package

### ** Examples

  ## No test: 
## Generate some data to preform the test
set.seed(1)
n <- 50
time <- rexp(n)
status <- sample(c(0,1),n,TRUE)
group <- c(rep(0,25),rep(1,25))

konp_test(time,status,group,n_perm=10^3)  
  
## End(No test)



