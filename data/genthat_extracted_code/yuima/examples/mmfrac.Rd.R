library(yuima)


### Name: mmfrac
### Title: mmfrac
### Aliases: mmfrac
### Keywords: ts

### ** Examples

# Estimating all Hurst parameter, diffusion coefficient  and drift coefficient 
# in fractional Ornstein-Uhlenbeck

model<-setModel(drift="-x*lambda",hurst=NA,diffusion="theta")
sampling<-setSampling(T=100,n=10000)
yui1<-simulate(model,true.param=list(theta=1,lambda=4),hurst=0.7,sampling=sampling)
mmfrac(yui1)




