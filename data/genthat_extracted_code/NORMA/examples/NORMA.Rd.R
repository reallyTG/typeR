library(NORMA)


### Name: NORMA
### Title: NORMA Optimization
### Aliases: NORMA

### ** Examples

NORMA(x=matrix(rnorm(10),nrow=10,ncol=1,byrow=TRUE),y=rnorm(10),kernel=function(x,y,gamma=0){x%*%y},
cost_der=function(phi,sigma_cuad,mu){return((phi-mu)/sigma_cuad)},cost_name="example",
sigma_cuad=1,mu=0)



