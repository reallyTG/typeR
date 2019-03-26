library(mau)


### Name: Sim.Const.Weights
### Title: Simulation of constrained weights
### Aliases: Sim.Const.Weights

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
constraints<-list( list( c(1,2), 0.7 ), 
                   list( c(3,4), 0.3 ) )
S<-Sim.Const.Weights( n, utilities, alpha, constraints )
plot.S<-Plot.Simulation.Weight( S$simulation, title = 'Simulations', 
                                xlab = 'ID', ylab = 'Utility' ) 
plot( plot.S )



