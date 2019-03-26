library(popdemo)


### Name: convt
### Title: Calculate time to convergence
### Aliases: convt

### ** Examples

 # Create a 3x3 PPM
 ( A <- matrix(c(0,1,2,0.5,0.1,0,0,0.6,0.6), byrow=TRUE, ncol=3) )

 # Create an initial stage structure
 ( initial <- c(1,3,2) )

 # Calculate the convergence time of the 3 stage-biased 
 # populations within 0.1% of lambda-max
 ( convt(A, accuracy=1e-3) )

 # Calculate the convergence time of the projection of initial and A
 # to within 0.001% of lambda-max
 ( convt(A, vector=initial, accuracy=1e-5) )




