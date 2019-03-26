library(gmvarkit)


### Name: add_data
### Title: Add data to object of class 'gmvar' defining a GMVAR model
### Aliases: add_data

### ** Examples

# These examples use the data 'eurusd' which comes with the
# package, but in a scaled form.
data <- cbind(10*eurusd[,1], 100*eurusd[,2])
colnames(data) <- colnames(eurusd)

# GMVAR(1,2), d=2 model:
params122 <- c(0.623, -0.129, 0.959, 0.089, -0.006, 1.006, 1.746,
 0.804, 5.804, 3.245, 7.913, 0.952, -0.037, -0.019, 0.943, 6.926,
 3.982, 12.135, 0.789)
mod122 <- GMVAR(p=1, M=2, d=2, params=params122)
mod122

mod122_2 <- add_data(data, mod122)
mod122_2


# GMVAR(2,2), d=2 model with AR-parameters restricted to be
# the same for both regimes:
C_mat <- rbind(diag(2*2^2), diag(2*2^2))
params222c <- c(1.031, 2.356, 1.786, 3.000, 1.250, 0.060, 0.036,
 1.335, -0.290, -0.083, -0.047, -0.356, 0.934, -0.152, 5.201, 5.883,
 3.560, 9.799, 0.368)
mod222c <- GMVAR(p=2, M=2, d=2, params=params222c, constraints=C_mat)
mod222c

mod222c_2 <- add_data(data, mod222c)
mod222c_2



