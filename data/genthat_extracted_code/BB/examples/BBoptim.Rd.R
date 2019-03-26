library(BB)


### Name: BBoptim
### Title: Large=Scale Nonlinear Optimization - A Wrapper for spg()
### Aliases: BBoptim
### Keywords: multivariate

### ** Examples

# Use a preset seed so test values are reproducable. 
require("setRNG")
old.seed <- setRNG(list(kind="Mersenne-Twister", normal.kind="Inversion",
    seed=1234))

rosbkext <- function(x){
# Extended Rosenbrock function
n <- length(x)
j <- 2 * (1:(n/2))
jm1 <- j - 1
sum(100 * (x[j] - x[jm1]^2)^2 + (1 - x[jm1])^2)
}

p0 <- rnorm(50)
spg(par=p0, fn=rosbkext)
BBoptim(par=p0, fn=rosbkext)

# compare the improvement in convergence when bounds are specified
BBoptim(par=p0, fn=rosbkext, lower=0) 

# identical to spg() with defaults
BBoptim(par=p0, fn=rosbkext, method=3, control=list(M=10, trace=TRUE))  



