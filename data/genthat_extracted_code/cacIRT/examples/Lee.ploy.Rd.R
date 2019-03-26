library(cacIRT)


### Name: Lee.poly
### Title: Computes classification accuracy and consistency with Lee's
###   approach for polytomous IRT models.
### Aliases: Lee.poly.D Lee.poly.P
### Keywords: ~IRT

### ** Examples

#Same example as \code{class.Lee()}, 
  #build \code{Pij} the same as in the example for \code{gen.rec.raw()}.

params <- matrix(c(1,1,1,1,-2,1,0,1,0,0,0,0),4,3)
theta <- rnorm(100)

Pij.flat <- irf(params, theta)$f
Pij.array <- array(NA, dim = c(length(theta), 2, nrow(params)))
Pij.array[,1,] <- 1 - Pij.flat #P(X_j = 0 | theta_i)
Pij.array[,2,] <- Pij.flat     #P(X_j = 1 | theta_i)

Lee.poly.P(2, Pij.array, theta)$Marginal

#in the dichotomous case, identical to \code{Lee.P()}
Lee.P(2, params, theta)$Marginal

#For Rudner and polytomous tests, compute the theta estimate and se and use those as input
theta.est <- theta 
#just for example

theta.se <- SEM(params, theta.est) 
#also for example, SEM() assumes 3PL model, 
#but if you use mirt or similar package, 
#the theta estimates and their se will be available

Rud.P(.5, theta.est, theta.se)$Marginal




