library(IndepTest)


### Name: MINTknown
### Title: MINTknown
### Aliases: MINTknown

### ** Examples

library(mvtnorm)
x=rnorm(1000); y=rnorm(1000);
# Independent univariate normal data
MINTknown(x,y,k=20,ky=30,y0=rnorm(100000))  
library(mvtnorm)
# Dependent univariate normal data
data=rmvnorm(1000,sigma=matrix(c(1,0.5,0.5,1),ncol=2))
# Dependent multivariate normal data
MINTknown(data[,1],data[,2],k=20,ky=30,y0=rnorm(100000))   
Sigma=matrix(c(1,0,0,0,0,1,0,0,0,0,1,0.5,0,0,0.5,1),ncol=4)
data=rmvnorm(1000,sigma=Sigma)
MINTknown(data[,1:3],data[,4],k=20,ky=30,w=TRUE,wy=FALSE,y0=rnorm(100000))




