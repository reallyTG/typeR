library(backShift)


### Name: metricsThreshold
### Title: Performance metrics for estimate of connectiviy matrix A.
### Aliases: metricsThreshold

### ** Examples

# true A
p  <- 3
A <- diag(p)*0
A[1,2] <- 0.8
A[2,3] <- -0.8
A[3,1] <- 0.8

# say an estimated connectivity matrix is given by:
A.est <- matrix(rnorm(p*p, 1e-3, 1e-3), ncol = p)
diag(A.est) <- 0
A.est[1,2] <- 0.76
A.est[2,3] <- -0.68
A.est[3,1] <- 0.83
 
# compute metrics with threshold 0.25
metricsThreshold(A, A.est, thres = 0.25)



