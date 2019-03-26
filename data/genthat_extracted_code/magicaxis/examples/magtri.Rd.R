library(magicaxis)


### Name: magtri
### Title: High level triangle plotting code for MCMC chains
### Aliases: magtri
### Keywords: MCMC mcmc posterior triangle

### ** Examples

Sigma=matrix(c(10,3,-5,3,12,8,-5,8,20),3,3)
chains=mvrnorm(n=1000, mu=1:3, Sigma=Sigma)
magtri(chains,tick=TRUE)



