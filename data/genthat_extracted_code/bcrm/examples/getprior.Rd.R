library(bcrm)


### Name: getprior
### Title: Samples from the specified prior distribution.
### Aliases: getprior

### ** Examples

prior.alpha<-list(1,1,1)
samples.alpha<-getprior(prior.alpha,2000)
hist(samples.alpha)



