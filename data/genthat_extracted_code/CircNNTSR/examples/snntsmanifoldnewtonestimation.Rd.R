library(CircNNTSR)


### Name: snntsmanifoldnewtonestimation
### Title: Parameter estimation for SNNTS distributions for spherical data
### Aliases: snntsmanifoldnewtonestimation

### ** Examples

data(Datab6fisher_ready)
data<-Datab6fisher_ready

M<-c(4,4)
cpar<-rnorm(prod(M+1))+rnorm(prod(M+1))*complex(real=0,imaginary=1)
cpar[1]<-Re(cpar[1])
cpar<- cpar/sqrt(sum(Mod(cpar)^2))

cest<-snntsmanifoldnewtonestimation(data,c(4,4),1000,TRUE,cpar) 
cest
cest<-snntsmanifoldnewtonestimation(data,c(1,2),1000)
cest



