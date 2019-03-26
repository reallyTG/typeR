library(BB)


### Name: multiStart
### Title: Nonlinear Optimization or Root-Finding with Multiple Starting
###   Values
### Aliases: multiStart
### Keywords: multivariate

### ** Examples

# Use a preset seed so the example is reproducable. 
require("setRNG")
old.seed <- setRNG(list(kind="Mersenne-Twister", normal.kind="Inversion",
    seed=1234))

# Finding multiple roots of a nonlinear system
brownlin <- function(x) {
# Brown's almost linear system(A.P. Morgan, ACM 1983)
# two distinct solutions if n is even
# three distinct solutions if n is odd  
  	n <- length(x)
  	f <- rep(NA, n)
	nm1 <- 1:(n-1)
	f[nm1] <- x[nm1] + sum(x) - (n+1)
	f[n] <- prod(x) - 1 
	f
}

p <- 9
n <- 50
p0 <- matrix(rnorm(n*p), n, p)  # n starting values, each of length p
ans <- multiStart(par=p0, fn=brownlin)
pmat <- ans$par[ans$conv, 1:p] # selecting only converged solutions
ord1 <- order(abs(pmat[,1]))
round(pmat[ord1, ], 3)  # all 3 roots can be seen

# An optimization example
rosbkext <- function(x){
n <- length(x)
j <- 2 * (1:(n/2))
jm1 <- j - 1
sum(100 * (x[j] - x[jm1]^2)^2 + (1 - x[jm1])^2)
}

p0 <- rnorm(50)
spg(par=p0, fn=rosbkext)
BBoptim(par=p0, fn=rosbkext)

pmat <- matrix(rnorm(100), 20, 5)  # 20 starting values each of length 5 
ans <- multiStart(par=pmat, fn=rosbkext, action="optimize")
ans
attr(ans, "details")[[1]]  # 

pmat <- ans$par[ans$conv, 1:5] # selecting only converged solutions
round(pmat, 3)



