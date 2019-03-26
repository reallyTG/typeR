library(gmvarkit)


### Name: in_paramspace
### Title: Determine whether the parameter vector lies in the parameter
###   space or not
### Aliases: in_paramspace

### ** Examples

# GMVAR(1,1), d=2 model:
params112 <- c(1.07, 127.71, 0.99, 0.00, -0.01, 0.99, 4.05,
  2.22, 8.87)
in_paramspace(p=1, M=1, d=2, params=params112)

# GMVAR(2,2), d=2 model:
params222 <- c(1.39, -0.77, 1.31, 0.14, 0.09, 1.29, -0.39,
 -0.07, -0.11, -0.28, 0.92, -0.03, 4.84, 1.01, 5.93, 1.25,
  0.08, -0.04, 1.27, -0.27, -0.07, 0.03, -0.31, 5.85, 3.57,
  9.84, 0.74)
in_paramspace(p=2, M=2, d=2, params=params222)

# GMVAR(2,2), d=2 model with AR-parameters restricted to be
# the same for both regimes:
C_mat <- rbind(diag(2*2^2), diag(2*2^2))
params222c <- c(1.03, 2.36, 1.79, 3.00, 1.25, 0.06,0.04,
 1.34, -0.29, -0.08, -0.05, -0.36, 0.93, -0.15, 5.20,
 5.88, 3.56, 9.80, 0.37)
in_paramspace(p=2, M=2, d=2, params=params222c, constraints=C_mat)



