library(SQUAREM)


### Name: fpiter
### Title: Fixed-Point Iteration Scheme
### Aliases: fpiter
### Keywords: optimization, EM algorithm

### ** Examples


##############################################################################
# Example 1:  EM algorithm for Poisson mixture estimation 
poissmix.em <- function(p,y) {
# The fixed point mapping giving a single E and M step of the EM algorithm
# 
pnew <- rep(NA,3)
i <- 0:(length(y)-1)
zi <- p[1]*exp(-p[2])*p[2]^i / (p[1]*exp(-p[2])*p[2]^i + (1 - p[1])*exp(-p[3])*p[3]^i)
pnew[1] <- sum(y*zi)/sum(y)
pnew[2] <- sum(y*i*zi)/sum(y*zi)
pnew[3] <- sum(y*i*(1-zi))/sum(y*(1-zi))
p <- pnew
return(pnew)
}

poissmix.loglik <- function(p,y) {
# Objective function whose local minimum is a fixed point \
# negative log-likelihood of binary poisson mixture
i <- 0:(length(y)-1)
loglik <- y*log(p[1]*exp(-p[2])*p[2]^i/exp(lgamma(i+1)) + 
		(1 - p[1])*exp(-p[3])*p[3]^i/exp(lgamma(i+1)))
return ( -sum(loglik) )
}

# Real data from Hasselblad (JASA 1969)
poissmix.dat <- data.frame(death=0:9, freq=c(162,267,271,185,111,61,27,8,3,1))
y <- poissmix.dat$freq
tol <- 1.e-08

# Use a preset seed so the example is reproducable. 
require("setRNG")
old.seed <- setRNG(list(kind="Mersenne-Twister", normal.kind="Inversion",
    seed=54321))

p0 <- c(runif(1),runif(2,0,4))  # random starting value

# Basic EM algorithm
pf1 <- fpiter(p=p0, y=y, fixptfn=poissmix.em, objfn=poissmix.loglik, control=list(tol=tol))


##############################################################################
# Example 2:  Accelerating the convergence of power method iteration for 
# finding the dominant eigenvector of a matrix 

power.method <- function(x, A) {

# Defines one iteration of the power method
# x = starting guess for dominant eigenvector
# A = a square matrix

ax <- as.numeric(A %*% x)
f <- ax / sqrt(as.numeric(crossprod(ax)))
f
}

# Finding the dominant eigenvector of the Bodewig matrix
# This is a famous matrix for which power method has trouble converging
# See, for example, Sidi, Ford, and Smith (SIAM Review, 1988) 
#
# Note: there are two eigenvalues that are equally dominant, 
#  but have opposite signs.
# Sometimes the power method finds the eigenvector corresponding to the 
# large positive eigenvalue, but other times it finds the eigenvector
# corresponding to the large negative eigenvalue
b <- c(2, 1, 3, 4, 1,  -3,   1,   5,  3,   1,   6,  -2,  4,   5,  -2,  -1)
bodewig.mat <- matrix(b,4,4)
eigen(bodewig.mat)

p0 <- rnorm(4)

# Standard power method iteration
ans1 <- fpiter(p0, fixptfn=power.method, A=bodewig.mat)
# re-scaling the eigenvector so that it has unit length
ans1$par <- ans1$par / sqrt(sum(ans1$par^2))  
ans1




