library(HWEBayes)


### Name: SinglefReject
### Title: Samples from the posterior for the single f model
### Aliases: SinglefReject
### Keywords: distribution

### ** Examples

data(DiabRecess)
postsampf1 <- SinglefReject(nsim=100,bvec=rep(1,4),lambdamu=-2.95,
   lambdasd=1.07,nvec=DiabRecess)




