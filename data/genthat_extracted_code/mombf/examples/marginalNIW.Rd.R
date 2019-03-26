library(mombf)


### Name: marginalNIW
### Title: Marginal likelihood under a multivariate Normal likelihood and a
###   conjugate Normal-inverse Wishart prior.
### Aliases: marginalNIW marginalNIW-methods
###   marginalNIW,missing,ANY,matrix,numeric,missing-method
###   marginalNIW,matrix,missing,missing,missing,missing-method
###   marginalNIW,matrix,missing,missing,missing,vector-method
###   marginalNIW,missing,list,list,numeric,missing-method
### Keywords: models htest

### ** Examples

#Simulate data
x= matrix(rnorm(100),ncol=2)

#Integrated likelihood under correct model
marginalNIW(x,g=1,nu0=4,log=FALSE)

#Integrated likelihood under random cluster allocations
z= rep(1:2,each=25)
marginalNIW(x,z=z,g=1,nu0=4,log=FALSE)



