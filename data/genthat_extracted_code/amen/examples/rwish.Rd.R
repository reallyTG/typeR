library(amen)


### Name: rwish
### Title: Simulation from a Wishart distribution
### Aliases: rwish

### ** Examples


## The expectation is S0*nu

S0<-rwish(diag(3)) 

SS<-matrix(0,3,3) 
for(s in 1:1000) { SS<-SS+rwish(S0,5) }

SS/s 

S0*5





