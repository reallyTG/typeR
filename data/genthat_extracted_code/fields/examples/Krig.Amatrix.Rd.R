library(fields)


### Name: Krig.Amatrix
### Title: Smoother (or "hat") matrix relating predicted values to the
###   dependent (Y) values.
### Aliases: Krig.Amatrix
### Keywords: spatial

### ** Examples

# Compute the A matrix or "hat" matrix for a thin plate spline 
# check that this gives the same predicted values  
tps.out<-Tps( ChicagoO3$x, ChicagoO3$y)
A<-Krig.Amatrix( tps.out, ChicagoO3$x)
test<- A%*%ChicagoO3$y 
# now compare this to predict( tps.out) or tps.out$fitted.values 
#                    they should be the same 
stats( test- tps.out$fitted.values)



