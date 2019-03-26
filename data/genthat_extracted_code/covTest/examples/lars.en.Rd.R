library(covTest)


### Name: lars.en
### Title: Function to fit least angle regression path of solution for the
###   elastic net.
### Aliases: lars.en
### Keywords: LARS lasso elastic net

### ** Examples

set.seed(432)
x=matrix(rnorm(100*10),ncol=10)
x=scale(x,TRUE,TRUE)/sqrt(99)
beta=c(3,rep(0,9))
y=x%*%beta+.4*rnorm(100)
a=lars.en(x,y,lambda2=.5)
  


