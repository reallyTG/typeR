library(ARpLMEC)


### Name: ARpLMEC.sim
### Title: Generating Censored Autoregressive Dataset with Linear Mixed
###   Effects.
### Aliases: ARpLMEC.sim

### ** Examples

p.cens   = 0.1
m           = 50
D = matrix(c(0.049,0.001,0.001,0.002),2,2)
sigma2 = 0.30
phi    = c(0.48,-0.2)
beta   = c(1,2,1)
nj=rep(6,m) 
x<-matrix(runif(sum(nj)*length(beta),-1,1),sum(nj),length(beta))
z<-matrix(runif(sum(nj)*dim(D)[1],-1,1),sum(nj),dim(D)[1])
data=ARpLMEC.sim(m,x,z,nj,beta,sigma2,D,phi,p.cens)
y<-data$y_cc
cc<-data$cc




