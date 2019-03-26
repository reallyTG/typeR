library(sppmix)


### Name: summary.bdmcmc_res
### Title: Summarize BDMCMC results
### Aliases: summary.bdmcmc_res

### ** Examples

## No test: 
# generate data
truemix<- rnormmix(m = 3, sig0 = .1, df = 5, xlim= c(0, 5), ylim = c(0, 5))
summary(truemix)
intsurf=to_int_surf(truemix, lambda = 100, win =spatstat::owin( c(0, 5),c(0, 5)))
pp1 <- rsppmix(intsurf = intsurf)# draw points
#Run BDMCMC and get posterior realizations
postfit=est_mix_bdmcmc(pp1,m=5)
#summary of the posterior results
summary(postfit)
summary(postfit, num_comp=2)
summary(postfit, num_comp=c(2,4))
## End(No test)




