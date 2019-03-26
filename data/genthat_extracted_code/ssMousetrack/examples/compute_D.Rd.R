library(ssMousetrack)


### Name: compute_D
### Title: Compute the matrix of distances D for kappa parameters
### Aliases: compute_D

### ** Examples


## Generate a generic matrix Y of I = 5 individuals and J = 1 trajectories (N = 61)
I <- 5; N <- 61
y_T <- pi/4; y_D <- (3*pi)/4
Y <- matrix(stats::rnorm(n = N*I,mean = (y_T+y_D)/2,sd = 10),N,I)
DY <- compute_D(Y=Y,y_T=y_T,y_D=y_D)




