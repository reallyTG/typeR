library(DDD)


### Name: dd_MS_loglik
### Title: Loglikelihood for macro-evolutionary succession under
###   diversity-dependent diversification with the key innovation at time t
###   = t_d
### Aliases: dd_MS_loglik
### Keywords: models

### ** Examples

pars1 = c(0.2,0.1,40,1.0,0.1,9.8)
pars2 = c(200,1,0,18.8,1,2)
missnumspec = 0
brtsM = c(25.2,24.6,24.0,22.5,21.7,20.4,19.9,19.7,18.8,17.1,15.8,11.8,9.7,8.9,5.7,5.2)
brtsS = c(9.6,8.6,7.4,4.9,2.5)
dd_MS_loglik(pars1,pars2,brtsM,brtsS,missnumspec,methode = 'ode45')



