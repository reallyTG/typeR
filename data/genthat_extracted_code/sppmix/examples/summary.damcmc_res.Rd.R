library(sppmix)


### Name: summary.damcmc_res
### Title: Summarize DAMCMC results
### Aliases: summary.damcmc_res

### ** Examples

## No test: 
# generate data
truemix<- rnormmix(m = 3, sig0 = .1, df = 5, xlim= c(0, 5), ylim = c(0, 5))
summary(truemix)
intsurf=to_int_surf(truemix, lambda = 100, win =spatstat::owin( c(0, 5),c(0, 5)))
pp1 = rsppmix(intsurf = intsurf)# draw points
#Run DAMCMC and get posterior realizations
postfit=est_mix_damcmc(pp1,m=3)
#summary of the posterior results
summary(postfit)
## End(No test)




