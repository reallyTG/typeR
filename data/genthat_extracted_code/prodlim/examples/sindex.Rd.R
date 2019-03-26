library(prodlim)


### Name: sindex
### Title: Index for evaluation of step functions.
### Aliases: sindex
### Keywords: misc

### ** Examples



test <- list(time = c(1, 1,5,5,2,7,9),
		status = c(1,0,1,0,1,1,0))
fit <- prodlim(Hist(time,status)~1,data=test)
jtimes <- fit$time
etimes <- c(0,.5,2,8,10)
fit$surv
c(1,fit$surv)[1+sindex(jtimes,etimes)]




