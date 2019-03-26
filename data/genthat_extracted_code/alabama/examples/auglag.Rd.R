library(alabama)


### Name: auglag
### Title: Nonlinear optimization with constraints
### Aliases: auglag auglag1 auglag2 auglag3
### Keywords: optimize

### ** Examples


fn <- function(x) (x[1] + 3*x[2] + x[3])^2 + 4 * (x[1] - x[2])^2

gr <- function(x) {
g <- rep(NA, 3)
g[1] <- 2*(x[1] + 3*x[2] + x[3]) + 8*(x[1] - x[2]) 
g[2] <- 6*(x[1] + 3*x[2] + x[3]) - 8*(x[1] - x[2]) 
g[3] <- 2*(x[1] + 3*x[2] + x[3])
g
}

heq <- function(x) {
h <- rep(NA, 1)
h[1] <- x[1] + x[2] + x[3] - 1
h
}


heq.jac <- function(x) {
j <- matrix(NA, 1, length(x))
j[1, ] <- c(1, 1, 1)
j
}

hin <- function(x) {
h <- rep(NA, 1)
h[1] <- 6*x[2] + 4*x[3] - x[1]^3 - 3
h[2] <- x[1]
h[3] <- x[2]
h[4] <- x[3]
h
}


hin.jac <- function(x) {
j <- matrix(NA, 4, length(x))
j[1, ] <- c(-3*x[1]^2, 6, 4)
j[2, ] <- c(1, 0, 0)
j[3, ] <- c(0, 1, 0)
j[4, ] <- c(0, 0, 1)
j
}

# Note: `auglag' accepts infeasible starting values
#
p0 <- runif(3)
ans <- auglag(par=p0, fn=fn, gr=gr, heq=heq, heq.jac=heq.jac, hin=hin, hin.jac=hin.jac) 
ans

# Not specifying the gradient and the Jacobians
set.seed(12)
p0 <- runif(3)
ans2 <- auglag(par=p0, fn=fn, heq=heq, hin=hin) 
ans2

# Using "nlminb" algorithm
ans3 <- auglag(par=p0, fn=fn, heq=heq, hin=hin, control.outer=list(method="nlminb")) 
ans3

# Turning off the second-order KKT condition check
ans4 <- auglag(par=p0, fn=fn, heq=heq, hin=hin, control.outer=list(kkt2.check=FALSE)) 
ans4




