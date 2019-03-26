library(latentnet)


### Name: merge.ergmm
### Title: Merge two or more replications of ERGMM fits
### Aliases: merge.ergmm
### Keywords: graphs models

### ** Examples


## No test: 
data(sampson)
# Run two short MCMC-based fits.
samp.fit1 <- ergmm(samplike ~ euclidean(d=2, G=3),
  control=ergmm.control(burnin=1000,interval=10,sample.size=2000))
samp.fit2 <- ergmm(samplike ~ euclidean(d=2, G=3),
  control=ergmm.control(burnin=1000,interval=10,sample.size=2000))

# Combine them, and summarize the result.
samp.fit <-  merge(samp.fit1,samp.fit2)
summary(samp.fit)
## End(No test)




