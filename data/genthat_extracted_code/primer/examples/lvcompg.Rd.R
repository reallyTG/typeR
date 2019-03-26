library(primer)


### Name: lvcompg
### Title: A General Lotka-Volterra Competition Model
### Aliases: lvcompg
### Keywords: methods

### ** Examples

## Specify the number of species
S <- 10
alpha <- .01
r <- runif(S)*2
a <- matrix(rnorm(S^2, m=alpha, sd=alpha/10), nrow=S, ncol=S)
parms <- list(r,a)
t=seq(0,40, by=.1)
N0 <- runif(S)/(S*alpha)
library(deSolve)
lvout <- ode(N0, t, lvcompg, parms)
matplot(t, lvout[,-1], type="l", ylab="N", log='y')



