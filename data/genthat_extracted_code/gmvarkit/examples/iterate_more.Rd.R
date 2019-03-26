library(gmvarkit)


### Name: iterate_more
### Title: Maximum likelihood estimation of GMVAR model with preliminary
###   estimates
### Aliases: iterate_more

### ** Examples

## No test: 
## These are long running examples that use parallel computing!

# These examples use the data 'eurusd' which comes with the
# package, but in a scaled form.
data <- cbind(10*eurusd[,1], 100*eurusd[,2])
colnames(data) <- colnames(eurusd)

# GMVAR(1,2) model, only 5 iterations of the variable metric
# algorithm
fit12 <- fitGMVAR(data, p=1, M=2, maxit=5)
fit12

# Iterate more:
fit12_2 <- iterate_more(fit12)
fit12_2


# GMVAR(2,2) model with autoregressive parameters restricted
# to be the same for all regimes, only 10 iterations of the
# variable metric algorithm
C_mat <- rbind(diag(2*2^2), diag(2*2^2))
fit22c <- fitGMVAR(data, p=2, M=2, constraints=C_mat, maxit=10)
fit22c

# Iterate more:
fit22c_2 <- iterate_more(fit22c)
fit22c_2

# GMVAR(3,2) model, only 10 iterations of the variable metric
# algorithm
fit32 <- fitGMVAR(data, p=3, M=2, maxit=10)
fit32

# Iterate more:
fit32_2 <- iterate_more(fit32)
fit32_2
## End(No test)



