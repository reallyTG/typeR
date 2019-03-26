library(mau)


### Name: Sim.Weights
### Title: Simulation of weights
### Aliases: Sim.Weights

### ** Examples

library( data.table )
N<-10
utilities<-data.table( id = 1:N, 
                       u1 = runif( N, 0, 1 ), 
                       u2 = runif( N, 0, 1 ), 
                       u3 = runif( N, 0, 1 ),
                       u4 = runif( N, 0, 1 ) )
n<-100
alpha<-c( 0.2, 0.5, 0.1, 0.2 )
S<-Sim.Weights( n, utilities, alpha )



