library(bliss)


### Name: dposterior
### Title: dposterior
### Aliases: dposterior

### ** Examples

data(data1)
data(param1)
# result of res_bliss1<-fit_Bliss(data=data1,param=param1)
data(res_bliss1)
# Compute the posterior density of the MCMC sample :
res_poste <- dposterior(res_bliss1$posterior_sample,data1)



