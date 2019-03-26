library(scs)


### Name: scs
### Title: SCS - Splitting Conic Solver
### Aliases: scs

### ** Examples

A <- matrix(c(1, 1), ncol=1)
b <- c(1, 1)
obj <- 1
cone <- list(f = 2)
control <- list(eps = 1e-3, max_iters = 50)
sol <- scs(A, b, obj, cone, control) 
sol



