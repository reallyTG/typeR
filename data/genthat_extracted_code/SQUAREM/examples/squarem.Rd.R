library(SQUAREM)


### Name: squarem
### Title: Squared Extrapolation Methods for Accelerating Slowly-Convergent
###   Fixed-Point Iterations
### Aliases: squarem
### Keywords: optimization, EM algorithm

### ** Examples

###########################################################################
# Also see the vignette by typing:
#  vignette("SQUAREM", all=FALSE)
#
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
# Objective function whose local minimum is a fixed point 
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

# First-order SQUAREM algorithm with SqS3 method
pf2 <- squarem(par=p0, y=y, fixptfn=poissmix.em, objfn=poissmix.loglik, 
               control=list(tol=tol))

# First-order SQUAREM algorithm with SqS2 method
pf3 <- squarem(par=p0, y=y, fixptfn=poissmix.em, objfn=poissmix.loglik, 
               control=list(method=2, tol=tol))

# First-order SQUAREM algorithm with SqS3 method; non-monotone 
# Note: the objective function is not evaluated when objfn.inc = Inf 
pf4 <- squarem(par=p0,y=y, fixptfn=poissmix.em,
               control=list(tol=tol, objfn.inc=Inf))

# First-order SQUAREM algorithm with SqS3 method; 
#  objective function is not specified
pf5 <- squarem(par=p0,y=y, fixptfn=poissmix.em, control=list(tol=tol, kr=0.1))

# Second-order (K=2) SQUAREM algorithm with SqRRE 
pf6 <- squarem(par=p0, y=y, fixptfn=poissmix.em, objfn=poissmix.loglik, 
               control=list (K=2, tol=tol))

# Second-order SQUAREM algorithm with SqRRE; objective function is not specified
pf7 <- squarem(par=p0, y=y, fixptfn=poissmix.em, control=list(K=2, tol=tol))

# Comparison of converged parameter estimates
par.mat <- rbind(pf1$par, pf2$par, pf3$par, pf4$par, pf5$par, pf6$par, pf7$par)
par.mat

# Compare objective function values 
# (note: `NA's indicate that \code{objfn} was not specified)
c(pf1$value, pf2$value, pf3$value, pf4$value, 
  pf5$value, pf6$value, pf7$value)

# Compare number of fixed-point evaluations
c(pf1$fpeval, pf2$fpeval, pf3$fpeval, pf4$fpeval, 
  pf5$fpeval, pf6$fpeval, pf7$fpeval)

# Compare mumber of objective function evaluations 
# (note: `0' indicate that \code{objfn} was not specified)
c(pf1$objfeval, pf2$objfeval, pf3$objfeval, pf4$objfeval, 
  pf5$objfeval, pf6$objfeval, pf7$objfeval)


##############################################################################
# Example 2:  Accelerating the convergence of power method iteration 
#  for finding the dominant eigenvector of a matrix 

power.method <- function(x, A) {
# Defines one iteration of the power method
# x = starting guess for dominant eigenvector
# A = a square matrix
ax <- as.numeric(A %*% x)
f <- ax / sqrt(as.numeric(crossprod(ax)))
f
}

# Finding the dominant eigenvector of the Bodewig matrix
b <- c(2, 1, 3, 4, 1,  -3,   1,   5,  3,   1,   6,  -2,  4,   5,  -2,  -1)
bodewig.mat <- matrix(b,4,4)
eigen(bodewig.mat)

p0 <- rnorm(4)

# Standard power method iteration
ans1 <- fpiter(p0, fixptfn=power.method, A=bodewig.mat)
# re-scaling the eigenvector so that it has unit length
ans1$par <- ans1$par / sqrt(sum(ans1$par^2))  
ans1

# First-order SQUAREM with default settings 
ans2 <- squarem(p0, fixptfn=power.method, A=bodewig.mat, control=list(K=1))
ans2$par <- ans2$par / sqrt(sum(ans2$par^2))
ans2

# First-order SQUAREM with a smaller step.min0
# Convergence is dramatically faster now!
ans3 <- squarem(p0, fixptfn=power.method, A=bodewig.mat, control=list(step.min0 = 0.5))
ans3$par <- ans3$par / sqrt(sum(ans3$par^2))
ans3

# Second-order SQUAREM
ans4 <- squarem(p0, fixptfn=power.method, A=bodewig.mat, control=list(K=2, method="rre"))
ans4$par <- ans4$par / sqrt(sum(ans4$par^2))
ans4



