library(gmvarkit)


### Name: GMVAR
### Title: Create object of class 'gmvar' defining a GMVAR model
### Aliases: GMVAR logLik.gmvar residuals.gmvar summary.gmvar plot.gmvar
###   print.gmvar

### ** Examples

# These examples use the data 'eurusd' which comes with the
# package, but in a scaled form.
data <- cbind(10*eurusd[,1], 100*eurusd[,2])
colnames(data) <- colnames(eurusd)

# GMVAR(1,2), d=2 model:
params122 <- c(0.623, -0.129, 0.959, 0.089, -0.006, 1.006, 1.746,
 0.804, 5.804, 3.245, 7.913, 0.952, -0.037, -0.019, 0.943, 6.926,
 3.982, 12.135, 0.789)
mod122 <- GMVAR(data, p=1, M=2, params=params122)
mod122

# GMVAR(1,2), d=2 model without data
mod122_2 <- GMVAR(p=1, M=2, d=2, params=params122)
mod122_2

# GMVAR(2,2), d=2 model with mean-parametrization:
params222 <- c(-11.904, 154.684, 1.314, 0.145, 0.094, 1.292, -0.389,
 -0.070, -0.109, -0.281, 0.920, -0.025, 4.839, 11.633, 124.983, 1.248,
  0.077, -0.040, 1.266, -0.272, -0.074, 0.034, -0.313, 5.855, 3.570,
  9.838, 0.740)
mod222 <- GMVAR(data, p=2, M=2, params=params222, parametrization="mean")
mod222

# GMVAR(2,2), d=2 model with AR-parameters restricted to be
# the same for both regimes:
C_mat <- rbind(diag(2*2^2), diag(2*2^2))
params222c <- c(1.031, 2.356, 1.786, 3.000, 1.250, 0.060, 0.036,
 1.335, -0.290, -0.083, -0.047, -0.356, 0.934, -0.152, 5.201, 5.883,
 3.560, 9.799, 0.368)
mod222c <- GMVAR(data, p=2, M=2, params=params222c, constraints=C_mat)
mod222c

# GMVAR(2,2), d=2 model with AR-parameters restricted to be
# the same for both regimes and the non-diagonal elements of
# the coefficient matrices constrained to zero.
tmp <- matrix(c(1, rep(0, 10), 1, rep(0, 8), 1, rep(0, 10), 1),
 nrow=2*2^2, byrow=FALSE)
C_mat2 <- rbind(tmp, tmp)
params222c2 <- c(0.355, 3.193, -0.114, 2.829, 1.263, 1.338, -0.292,
 -0.362, 5.597, 3.456, 9.622, 0.982, -0.327, 5.236, 0.650)
mod222c2 <- GMVAR(data, p=2, M=2, params=params222c2,
  constraints=C_mat2)
mod222c2



