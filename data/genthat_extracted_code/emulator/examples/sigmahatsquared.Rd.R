library(emulator)


### Name: sigmahatsquared
### Title: Estimator for sigma squared
### Aliases: sigmahatsquared sigmahatsquared.A
### Keywords: models

### ** Examples


## First, set sigmasquared to a value that we will try to estimate at the end:
REAL.SIGMASQ <- 0.3

## First, some data:
val <- latin.hypercube(100,6)
H <- regressor.multi(val,func=regressor.basis)

## now some scales:
 fish <- c(1,1,1,1,1,4)

## A and Ainv
A <- corr.matrix(as.matrix(val),scales=fish)
Ainv <- solve(A)

## a real relation; as used in helppage for interpolant:
real.relation <- function(x){sum( (1:6)*x )}

## use the real relation:
d <- apply(val,1,real.relation)

## now add some Gaussian process noise:
d.noisy <-  as.vector(rmvnorm(n=1,mean=d, REAL.SIGMASQ*A))

## now estimate REAL.SIGMASQ:
sigmahatsquared(H,Ainv,d.noisy)

## That shouldn't be too far from the real value specified above.

## Finally, a sanity check:
sigmahatsquared(H,Ainv,d.noisy) - sigmahatsquared.A(H,A=A,d.noisy)




