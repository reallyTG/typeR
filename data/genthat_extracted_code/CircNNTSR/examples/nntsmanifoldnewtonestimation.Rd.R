library(CircNNTSR)


### Name: nntsmanifoldnewtonestimation
### Title: Parameter estimation for NNTS distributions
### Aliases: nntsmanifoldnewtonestimation

### ** Examples

a<-c(runif(10,3*pi/2,2*pi-0.00000001),runif(10,pi/2,pi-0.00000001))
#Estimation of the NNTSdensity with 2 components for data and 1000 iterations
nntsmanifoldnewtonestimation(a,2,1000)

data(Turtles_radians)
#Empirical analysis of data
Turtles_hist<-hist(Turtles_radians,breaks=10,freq=FALSE)
#Estimation of the NNTS density with 3 componentes for data
nntsmanifoldnewtonestimation(Turtles_radians,3)



