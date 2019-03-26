library(gmvarkit)


### Name: print_std_errors
### Title: Print standard errors of GMVAR model in the same form as the
###   model estimates are printed
### Aliases: print_std_errors

### ** Examples

## No test: 
## These are long running examples that use parallel computing!

# These examples use the data 'eurusd' which comes with the
# package, but in a scaled form.
data <- cbind(10*eurusd[,1], 100*eurusd[,2])
colnames(data) <- colnames(eurusd)

# GMVAR(1,2) model with default settings
fit12 <- fitGMVAR(data, p=1, M=2)
fit12
print_std_errors(fit12)

# GMVAR(2,2) model with mean parametrization
fit22 <- fitGMVAR(data, p=2, M=2, parametrization="mean")
fit22
print_std_errors(fit22)

# GMVAR(2,2) model with autoregressive parameters restricted
# to be the same for all regimes
C_mat <- rbind(diag(2*2^2), diag(2*2^2))
fit22c <- fitGMVAR(data, p=2, M=2, constraints=C_mat)
fit22c
print_std_errors(fit22c)

# GMVAR(2,2) model with autoregressive parameters restricted
# to be the same for all regimes and non-diagonl elements
# the coefficient matrices constrained to zero.
tmp <- matrix(c(1, rep(0, 10), 1, rep(0, 8), 1, rep(0, 10), 1),
 nrow=2*2^2, byrow=FALSE)
C_mat2 <- rbind(tmp, tmp)
fit22c2 <- fitGMVAR(data, p=2, M=2, constraints=C_mat2, ncalls=10)
fit22c2
print_std_errors(fit22c2)
## End(No test)



