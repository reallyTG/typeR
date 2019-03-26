library(loggle)


### Name: example_source
### Title: Source code for generating time-varying graphs
### Aliases: example_source

### ** Examples

library(Matrix)
library(sparseMVN)
library(matrixcalc)

# function to generate time-varying graphs and 
# observations
loggle.graph <- function(p, N, alpha = 0.28) {
  
  done <- FALSE
  
  while(!done) {
    
    # generate time-varying lower triangular matrices
    t <- seq(0, 1, length = N)
    B1 <- matrix(rnorm(p^2, 0, 1/2), p, p)
    B2 <- matrix(rnorm(p^2, 0, 1/2), p, p)
    B3 <- matrix(rnorm(p^2, 0, 1/2), p, p)
    B4 <- matrix(rnorm(p^2, 0, 1/2), p, p)
    B1[upper.tri(B1)] <- 0
    B2[upper.tri(B2)] <- 0
    B3[upper.tri(B3)] <- 0
    B4[upper.tri(B4)] <- 0
    uni <- runif(4, -0.5, 0.5)
    
    Omega.true <- vector("list", N)
    X <- matrix(0, p, N)
    
    for(i in 1:N) {
      
      # generate raw precision matrix at time point i
      G <- (B1*sin(pi*t[i]/2+uni[1]) 
            + B2*cos(pi*t[i]/2+uni[2]) 
            + B3*sin(pi*t[i]/4+uni[3]) 
            + B4*cos(pi*t[i]/4+uni[4]))/2
      Omega <- G %*% t(G)
      Omega <- Omega %*% diag(1/sqrt((1:p)))
      Omega[upper.tri(Omega)] <- 0
      Omega <- Omega + t(Omega)
      Omega.diag <- diag(Omega)/(2*sqrt(1:p))+log(p,10)/4
      
      # implement soft-thresholding to off-diagonals in 
      # precision matrix
      Omega.t1 <- matrix(1, p, p) - alpha/abs(Omega)
      Omega.t2 <- matrix(1, p, p) - alpha/(2*abs(Omega))
      Omega <- Omega.t2 * (Omega.t1 > 0) * Omega
      diag(Omega) <- Omega.diag
      
      if(!is.positive.definite(Omega)) {
        break
      }
      
      Omega.true[[i]] <- Matrix(Omega, sparse = TRUE)
      
      # generate observations from precision matrix
      X[, i] <- rmvn.sparse(1, rep(0, p), 
      Cholesky(Omega.true[[i]]))
      
      if(i == N) {
        done = TRUE
      }
    }
  }
  
  result <- list(Omega.true = Omega.true, X = X)
  return(result)
}

# generate an example dataset of time-varying graphs 
# via loggle.graph
set.seed(10)
example <- loggle.graph(p = 15, N = 1001)



