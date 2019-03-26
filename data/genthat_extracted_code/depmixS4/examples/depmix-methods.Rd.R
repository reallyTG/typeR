library(depmixS4)


### Name: depmix-methods
### Title: 'depmix' and 'mix' methods.
### Aliases: depmix-methods logLik logLik,depmix-method logLik,mix-method
###   logLik,depmix.fitted.classLik-method
###   logLik,mix.fitted.classLik-method nobs nobs,depmix-method
###   nobs,mix-method npar npar,depmix-method npar,mix-method freepars
###   freepars,depmix-method freepars,mix-method
###   freepars,depmix.fitted-method freepars,mix.fitted-method setpars
###   setpars,depmix-method setpars,mix-method getpars
###   getpars,depmix-method getpars,mix-method getmodel
###   getmodel,depmix-method getmodel,mix-method
### Keywords: methods

### ** Examples


# create a 2 state model with one continuous and one binary response
data(speed)
mod <- depmix(list(rt~1,corr~1),data=speed,nstates=2,family=list(gaussian(),multinomial()))

getmodel(mod,"response",2,1)

getmodel(mod,"prior")

# get the loglikelihood of the model
logLik(mod)

# to see the ordering of parameters to use in setpars
mod <- setpars(mod, value=1:npar(mod))
mod

# to see which parameters are fixed (by default only baseline parameters in
# the multinomial logistic models for the transition models and the initial
# state probabilities model)
mod <- setpars(mod, getpars(mod,which="fixed"))
mod




