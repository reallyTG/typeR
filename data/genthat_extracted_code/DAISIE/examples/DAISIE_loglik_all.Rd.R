library(DAISIE)


### Name: DAISIE_loglik_all
### Title: Computes the loglikelihood of the DAISIE model given data and a
###   set of model parameters
### Aliases: DAISIE_loglik_all DAISIE_loglik_CS
### Keywords: models

### ** Examples

data(Galapagos_datalist_2types)
pars1 = c(0.195442017,0.087959583,Inf,0.002247364,0.873605049,
          3755.202241,8.909285094,14.99999923,0.002247364,0.873605049,0.163)
pars2 = c(100,11,0,1)
DAISIE_loglik_all(pars1,pars2,Galapagos_datalist_2types)



