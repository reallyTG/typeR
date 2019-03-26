library(EpiILMCT)


### Name: datagen
### Title: Generate epidemics from distance-based and/or network-based
###   continuous-time ILMs.
### Aliases: datagen
### Keywords: Simulation

### ** Examples

## Individual locations
N<-50
xx<-cbind(runif(N,0,10),runif(N,0,10))
## Euclidean distance matrix:
d3<-as.matrix(dist(xx,method="euclidean"))
## The susceptible covariate:
covsust<-cbind(rep(1,N),rbinom(N,1,0.5))
## The contact network with power-law model of parameter values as beta=1.8 and alpha=1:
net<-contactnet(type="powerlaw",location=xx,beta=1.8,alpha=1,plot=TRUE)
## Distance-based SIR-ILMs
## Epidemic is generated with parameter values as
## alpha_s(1)=0.8, alpha_s(2)=0.5 and beta=2
## The infectious period is generated from gamma(1,2) which is equivalent to Exp(2).
epi1<-datagen(type="SIR", kerneltype = "distance", kernelmatrix = d3 ,
        distancekernel = "powerlaw",suspar = c(0.8,0.5), kernel.par = 2, 
        delta = c(1,2),suscov = covsust)
## Network-based SIR-ILMs
## Epidemic is generated with parameter values as
## alpha_s(1)=0.8 and alpha_s(2)=0.5
## The infectious period is generated from gamma(1,2) which is equivalent to Exp(2).
epi2<-datagen(type="SIR", kerneltype = "network", kernelmatrix = net, suspar = c(0.8,0.5), 
		delta = c(1,2), suscov = covsust)
## Distance-based SINR-ILMs
## Epidemic is generated with parameter values as
## alpha_s(1)=0.08, alpha_s(2)=0.5 and beta=2
## The incubation and delay periods are generated from gamma(1,2) which is equivalent to Exp(2).
epi3<-datagen(type="SINR", kerneltype = "distance",  kernelmatrix = d3, distancekernel = "powerlaw",
		suspar = c(0.08,0.5), kernel.par = 2, delta = matrix(c(1,1,2,2),ncol=2,nrow=2), 
		suscov = covsust)
## Network-based SINR-ILMs
## Epidemic is generated with parameter values as
## alpha_s(1)=0.8 and alpha_s(2)=0.5
## The incubation and delay periods are generated from gamma(1,2) which is equivalent to Exp(2).
epi4<-datagen(type="SINR", kerneltype = "network", kernelmatrix = net, suspar = c(0.8,0.5), 
		delta = matrix(c(1,1,2,2),ncol=2,nrow=2), suscov = covsust)
## Network-based SINR-ILMs
## Epidemic is generated with parameter values as
## alpha_s(1)=0.08, alpha_s(2)=0.5, beta_1 = 2 and beta_2 = 0.5
## The incubation and delay periods are generated from gamma(1,2) which is equivalent to Exp(2).
epi5<-datagen(type="SINR", kerneltype = "both", kernelmatrix = list(d3,net), 
		distancekernel = "powerlaw",suspar = c(0.08,0.5),kernel.par = c(2,0.5), 
		delta = matrix(c(1,1,2,2),ncol=2,nrow=2), suscov = covsust)



