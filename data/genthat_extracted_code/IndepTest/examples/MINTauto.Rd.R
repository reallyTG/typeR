library(IndepTest)


### Name: MINTauto
### Title: MINTauto
### Aliases: MINTauto

### ** Examples

## No test: 
# Independent univariate normal data
x=rnorm(1000); y=rnorm(1000);
MINTauto(x,y,kmax=200,B1=100,B2=100)
# Dependent univariate normal data
library(mvtnorm)
data=rmvnorm(1000,sigma=matrix(c(1,0.5,0.5,1),ncol=2))  
MINTauto(data[,1],data[,2],kmax=200,B1=100,B2=100)
# Dependent multivariate normal data
Sigma=matrix(c(1,0,0,0,0,1,0,0,0,0,1,0.5,0,0,0.5,1),ncol=4)
data=rmvnorm(1000,sigma=Sigma)
MINTauto(data[,1:3],data[,4],kmax=50,B1=100,B2=100)
## End(No test)




