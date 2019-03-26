library(IndepTest)


### Name: MINTav
### Title: MINTav
### Aliases: MINTav

### ** Examples

## No test: 
# Independent univariate normal data
x=rnorm(1000); y=rnorm(1000);
MINTav(x,y,K=1:200,B=100)
# Dependent univariate normal data
library(mvtnorm);
data=rmvnorm(1000,sigma=matrix(c(1,0.5,0.5,1),ncol=2))  
MINTav(data[,1],data[,2],K=1:200,B=100)
# Dependent multivariate normal data
Sigma=matrix(c(1,0,0,0,0,1,0,0,0,0,1,0.5,0,0,0.5,1),ncol=4);
data=rmvnorm(1000,sigma=Sigma)
MINTav(data[,1:3],data[,4],K=1:50,B=100)
## End(No test)




