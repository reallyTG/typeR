library(primer)


### Name: compcolM
### Title: Multi-species Competition-colonization Model, With Habitat
###   Destruction
### Aliases: compcolM
### Keywords: methods

### ** Examples

library(deSolve)
S <- 10
ci <- 2^seq(-5, 5, length=S)
m <- rep(.1, S)
params <- list(ci=ci, m=m, S=S, D=0)
init.N <- rep(0.01, S); t=seq(1, 200, .1)
cc.out <- ode(init.N, t, compcolM, params)
matplot(t, cc.out[, -1], type="l", ylab="Proportion of Habitat", xlab="Years")




