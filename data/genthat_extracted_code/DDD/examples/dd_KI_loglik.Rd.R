library(DDD)


### Name: dd_KI_loglik
### Title: Loglikelihood for diversity-dependent diversification models
###   with decoupling of a subclade from a main clade at time t = t_d
### Aliases: dd_KI_loglik
### Keywords: models

### ** Examples

pars1 = c(0.25,0.12,25.51,1.0,0.16,8.61,9.8)
pars2 = c(200,1,0,18.8,1,2)
missnumspec = 0
brtsM = c(25.2,24.6,24.0,22.5,21.7,20.4,19.9,19.7,18.8,17.1,15.8,11.8,9.7,8.9,5.7,5.2)
brtsS = c(9.6,8.6,7.4,4.9,2.5)
dd_KI_loglik(pars1,pars2,brtsM,brtsS,missnumspec,methode = 'ode45')



