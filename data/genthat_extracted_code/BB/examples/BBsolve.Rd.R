library(BB)


### Name: BBsolve
### Title: Solving Nonlinear System of Equations - A Wrapper for dfsane()
### Aliases: BBsolve
### Keywords: multivariate

### ** Examples

# Use a preset seed so test values are reproducable. 
require("setRNG")
old.seed <- setRNG(list(kind="Mersenne-Twister", normal.kind="Inversion",
    seed=1234))

broydt <- function(x) {
n <- length(x)
f <- rep(NA, n)
h <- 2
f[1] <- ((3 - h*x[1]) * x[1]) - 2*x[2] + 1
tnm1 <- 2:(n-1)
f[tnm1] <- ((3 - h*x[tnm1]) * x[tnm1]) - x[tnm1-1] - 2*x[tnm1+1] + 1
f[n] <- ((3 - h*x[n]) * x[n]) - x[n-1] + 1
f
}

p0 <- rnorm(50)
BBsolve(par=p0, fn=broydt)  # this works 
dfsane(par=p0, fn=broydt) # but this is highly unliikely to work.

# this implements the 3 BB steplengths with M = 50, and without Nelder-Mead initialization
BBsolve(par=p0, fn=broydt, control=list(M=50, NM=FALSE))

# this implements BB steplength 1 with M = 50 and 10, and both with and 
#   without Nelder-Mead initialization  
BBsolve(par=p0, fn=broydt, method=1, control=list(M=c(50, 10))) 

# identical to dfsane() with defaults
BBsolve(par=p0, fn=broydt, method=2, control=list(M=10, NM=FALSE)) 



