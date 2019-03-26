library(emplik)


### Name: emplikH2.test
### Title: Empirical likelihood for weighted hazard with right censored,
###   left truncated data
### Aliases: emplikH2.test
### Keywords: nonparametric survival htest

### ** Examples

z1<-c(1,2,3,4,5)
d1<-c(1,1,0,1,1)
fun4 <- function(x, theta) { as.numeric(x <= theta) }
emplikH2.test(x=z1,d=d1, K=0.5, fun=fun4, theta=3.5)
#Next, test if H(3.5) = log(2) .
emplikH2.test(x=z1,d=d1, K=log(2), fun=fun4, theta=3.5)
#Next, try one sample log rank test
indi <- function(x,y){ as.numeric(x >= y) }
fun3 <- function(t,z){rowsum(outer(z,t,FUN="indi"),group=rep(1,length(z)))} 
emplikH2.test(x=z1, d=d1, K=sum(0.25*z1), fun=fun3, z=z1) 
##this is testing if the data is from an exp(0.25) population.



