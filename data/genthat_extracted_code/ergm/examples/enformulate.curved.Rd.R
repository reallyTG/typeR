library(ergm)


### Name: enformulate.curved
### Title: Convert a curved ERGM into a form suitable as initial values for
###   the same ergm.
### Aliases: enformulate.curved enformulate.curved.ergm
###   enformulate.curved.formula
### Keywords: model

### ** Examples


## No test: 
## Don't show: 
options(ergm.eval.loglik=FALSE)
## End(Don't show)
data(sampson)
gest<-ergm(samplike~edges+gwesp(decay=.5, fixed=FALSE), 
    control=control.ergm(MCMC.burnin=1024, MCMC.interval=8, MCMLE.maxit=1))
# Error:
gest2<-try(ergm(gest$formula,
                control=control.ergm(init=coef(gest), MCMC.burnin=1024,
                                     MCMC.interval=8, MCMLE.maxit=1)))
print(gest2)

# Works:
tmp<-enformulate.curved(gest)
tmp
gest2<-try(ergm(tmp$formula,
                control=control.ergm(init=tmp$theta, MCMC.burnin=1024,
                                     MCMC.interval=8, MCMLE.maxit=1)))
summary(gest2)
## End(No test)




