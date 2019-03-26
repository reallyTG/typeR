library(coxsei)


### Name: coxseiInt
### Title: Calculate the estimator of the cumulative baseline intensity
###   function in the CoxSEI model.
### Aliases: coxseiInt
### Keywords: ~survival ~regression

### ** Examples

data("dat")
est <- coxseiest3(dat,c(0.2,0.4,0.6,log(0.06),log(5)))
pe <- est$par; pe[4:5] <- exp(pe[4:5]);
ve <- diag(pe) %*% solve(est$hessian, diag(pe));
cintest <- coxseiInt(dat,pe,vcovmat=ve)
plot(cintest,type="s")



