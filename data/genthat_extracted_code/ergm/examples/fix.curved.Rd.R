library(ergm)


### Name: fix.curved
### Title: Convert a curved ERGM into a corresponding "fixed" ERGM.
### Aliases: fix.curved fix.curved.ergm fix.curved.formula
### Keywords: model

### ** Examples


## No test: 
## Don't show: 
options(ergm.eval.loglik=FALSE)
## End(Don't show)
data(sampson)
gest<-ergm(samplike~edges+gwesp(decay=.5,fixed=FALSE),
           control=control.ergm(MCMLE.maxit=3, MCMC.burnin=1024, MCMC.interval=128))
summary(gest)
# A statistic for esp(1),...,esp(16)
simulate(gest,statsonly=TRUE)

tmp<-fix.curved(gest)
tmp
# A gwesp() statistic only
simulate(tmp$formula, coef=tmp$theta, statsonly=TRUE) 
## End(No test)




