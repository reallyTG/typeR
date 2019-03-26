library(lbfgs)


### Name: lbfgs
### Title: Optimize function using libLBFGS library
### Aliases: lbfgs

### ** Examples


# Rosenbrock Banana function 

objective <- function(x) {   
    x1 <- x[1]
    x2 <- x[2]
    100 * (x2 - x1 * x1)^2 + (1 - x1)^2
}

gradient <- function(x) { ## Gradient of 'fr'
    x1 <- x[1]
    x2 <- x[2]
    c(-400 * x1 * (x2 - x1 * x1) - 2 * (1 - x1),
       200 *      (x2 - x1 * x1))
}

output <- lbfgs(objective, gradient, c(-1.2,1))

# An example using OWL-QN to perform a Poisson regression using data from
# Golub, Todd R., et al. "Molecular classification of cancer: class discovery 
# and class prediction by gene expression monitoring." Science 286.5439 (1999):
# 531-537. A workspace with the dataset ("Leukemia.RData") is included 
# in the package distribution.

# data(Leukemia)

# X <- Leukemia$x
# y <- Leukemia$y
# X1 <- cbind(1, X)

# pois.likelihood <- function(par, X, y, prec=0) {
#   Xbeta <- X%*%par
#   -(sum(y*Xbeta - exp(Xbeta)) -.5*sum(par^2*prec))
# }

# pois.gradient <- function(par, X, y, prec=0) {
#   Xbeta <- X%*%par
#   expXbeta <- exp(Xbeta)
#   -(crossprod(X,(y-expXbeta)) -par*prec)
# }

# output <- lbfgs(pois.likelihood,pois.gradient, X=X1, y=y, prec=0,
#           rep(0, ncol(X1)), invisible=1, orthantwise_c=10, 
#           linesearch_algorithm="LBFGS_LINESEARCH_BACKTRACKING",
#           orthantwise_start = 1, orthantwise_end = ncol(X1))

# Trivial Example      

objective <- function(x){
  a <- x[1]
  b <- x[2]
  return(a^2 + b^2)
}

gradient <- function(x){
  return(2*x)
}

output <- lbfgs(objective, gradient, c(100,13))




