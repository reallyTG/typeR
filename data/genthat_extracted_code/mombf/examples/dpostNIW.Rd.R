library(mombf)


### Name: dpostNIW
### Title: Posterior Normal-IWishart density
### Aliases: dpostNIW rpostNIW
### Keywords: distribution

### ** Examples

#Simulate data
x= matrix(rnorm(100),ncol=2)
#Evaluate posterior at data-generating truth
mu= c(0,0)
Sigma= diag(2)
dpostNIW(mu,Sigma,x=x,g=1,nu0=4,log=FALSE)



