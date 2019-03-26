library(EMSHS)


### Name: EMSHS
### Title: EM Estimator for Bayesian Shrinkage approach with Structural
###   Information incorporated
### Aliases: EMSHS

### ** Examples


 # Example with no edges for a high-dimensional data
 # with n = 25 observations and p = 50 predictors

 set.seed(100)

 X <- matrix(rnorm(25*50), ncol = 50)
 B <- matrix(c(1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
               0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
               0,0,0,0,0,0,0,0,0,0), ncol = 1)
 e <- matrix(rnorm(25*1), ncol = 1)
 y <- matrix(X %*% B + e, ncol = 1)
 mus <- 2.3
 nu <- 0.3


 em_no_edge <- EMSHS(y, X, mus, nu, E = NULL,
                     a_sigma = 1, b_sigma = 1, a_omega = 2, b_omega = 1,
                     w = 1, eps = 1e-5)


 # Example with user-defined set of sorted, undirected
 # edges (E) for a high-dimensional data with n = 25
 # and p = 50

 X <- matrix(rnorm(25*50), ncol = 50)
 B <- matrix(c(1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
               0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
               0,0,0,0,0,0,0,0,0,0), ncol = 1)
 e <- matrix(rnorm(25*1), ncol = 1)
 y <- matrix(X %*% B + e, ncol = 1)
 mus <- 2.3
 nu <- 0.3
EE <- matrix(c(1,4,
              4,1,
              1,2,
              2,1,
              1,5,
              5,1,
              2,3,
              3,2,
              3,5,
              5,3,
              10,11,
              11,10,
              19,11,
              11,19,
              36,35,
              35,36,
              31,35,
              35,31,
              31,22,
              22,31,
              22,45,
              45,22,
              45,32,
              32,45,
              22,21,
              21,22,
              31,21,
              21,31,
              21,25,
              25,21,
              21,18,
              18,21,
              18,49,
              49,18,
              49,47,
              47,49,
              47,37,
              37,47,
              37,21,
              21,37,
              18,25,
              25,18), nrow = 42, ncol = 2, byrow = TRUE)

 # Sort edges by first column then second column

 E <- EE[do.call(order, lapply(1:ncol(EE), function(i) EE[,i])),]

 em_edge <- EMSHS(y, X, mus, nu, E,
                  a_sigma = 1, b_sigma = 1, a_omega = 2, b_omega = 1,
                  w = 1, eps = 1e-5)



