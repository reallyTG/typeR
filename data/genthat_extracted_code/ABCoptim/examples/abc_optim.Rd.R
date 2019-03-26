library(ABCoptim)


### Name: abc_optim
### Title: Artificial Bee Colony Optimization
### Aliases: abc_optim abc_answer print.abc_answer abc_cpp plot.abc_answer
### Keywords: optimization

### ** Examples


# EXAMPLE 1: The minimum is at (pi,pi) --------------------------------------

fun <- function(x) {
  -cos(x[1])*cos(x[2])*exp(-((x[1] - pi)^2 + (x[2] - pi)^2))
}

abc_optim(rep(0,2), fun, lb=-10, ub=10, criter=50)

# This should be equivalent
abc_cpp(rep(0,2), fun, lb=-10, ub=10, criter=50)

# We can also turn this into a maximization problem, and get the same
# results 
fun <- function(x) {
  # We've removed the '-' from the equation
  cos(x[1])*cos(x[2])*exp(-((x[1] - pi)^2 + (x[2] - pi)^2))
}

abc_cpp(rep(0,2), fun, lb=-10, ub=10, criter=50, fnscale = -1)

# EXAMPLE 2: global minimum at about (-15.81515) ----------------------------

fw <- function (x)
  10*sin(0.3*x)*sin(1.3*x^2) + 0.00001*x^4 + 0.2*x+80

ans <- abc_optim(50, fw, lb=-100, ub=100, criter=100)
ans[c("par", "counts", "value")]


# EXAMPLE 3: 5D sphere, global minimum at about (0,0,0,0,0) -----------------
fs <- function(x) sum(x^2)

ans <- abc_optim(rep(10,5), fs, lb=-100, ub=100, criter=200)
ans[c("par", "counts", "value")]


# EXAMPLE 4: An Ordinary Linear Regression ----------------------------------

set.seed(1231)
k <- 4
n <- 5e2

# Data generating process
w <- matrix(rnorm(k), ncol=1)     # This are the model parameters
X <- matrix(rnorm(k*n), ncol = k) # This are the controls
y <- X %*% w                      # This is the observed data

# Objective function
fun <- function(x) {
  sum((y - X%*%x)^2)
}

# Running the regression
ans <- abc_optim(rep(0,k), fun, lb = -10000, ub=10000)

# Here are the outcomes: Both columns should be the same
cbind(ans$par, w)
#             [,1]        [,2]
# [1,] -0.08051177 -0.08051177
# [2,]  0.69528553  0.69528553
# [3,] -1.75956316 -1.75956316
# [4,]  0.36156427  0.36156427


# This is just like OLS, with no constant
coef(lm(y~0+X))
#         X1          X2          X3          X4 
#-0.08051177  0.69528553 -1.75956316  0.36156427 




