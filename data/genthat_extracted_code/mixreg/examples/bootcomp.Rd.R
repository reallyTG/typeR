library(mixreg)


### Name: bootcomp
### Title: Perform a bootstrap test for the number of components in a
###   mixture of regressions.
### Aliases: bootcomp
### Keywords: models regression

### ** Examples

TS1 <- list(list(beta=c(3.0,0.1),sigsq=16,lambda=0.5),
            list(beta=c(0.0,0.0),sigsq=16,lambda=0.5))
TS2 <- list(list(beta=c(3.0,0.1),sigsq=9,lambda=1/3),
            list(beta=c(1.5,0.05),sigsq=9,lambda=1/3),
            list(beta=c(0.0,0.0),sigsq=9,lambda=1/3))
data(aphids)
x <- aphids$n.aphids
y <- aphids$n.inf
## Not run: 
##D   nboot <- 1000
## End(Not run)
## Don't show: 
  nboot <- 10
## End(Don't show)
boot.23 <- bootcomp(x,y,nboot=nboot,ts1=TS1,ts2=TS2)



