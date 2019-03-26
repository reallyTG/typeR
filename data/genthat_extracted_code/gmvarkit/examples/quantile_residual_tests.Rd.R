library(gmvarkit)


### Name: plot.qrtest
### Title: Quantile residual tests
### Aliases: plot.qrtest print.qrtest quantile_residual_tests

### ** Examples

## No test: 
## These are long running examples that use parallel computing!

# These examples use the data 'eurusd' which comes with the
# package, but in a scaled form.
data <- cbind(10*eurusd[,1], 100*eurusd[,2])
colnames(data) <- colnames(eurusd)

# GMVAR(1,2) model with default settings
fit12 <- fitGMVAR(data, p=1, M=2)
qrtests12 <- quantile_residual_tests(fit12)
qrtests12
plot(qrtests12)

# GMVAR(2,2) model with mean parametrization
fit22 <- fitGMVAR(data, p=2, M=2, parametrization="mean")
qrtests22 <- quantile_residual_tests(fit22, nsimu=1)
qrtests22

# GMVAR(2,2) model with autoregressive parameters restricted
# to be the same for all regimes
C_mat <- rbind(diag(2*2^2), diag(2*2^2))
fit22c <- fitGMVAR(data, p=2, M=2, constraints=C_mat, ncalls=12)
qrtests22c <- quantile_residual_tests(fit22c, lags_ac=c(1, 4),
                nsimu=10000, print_res=TRUE)
qrtests22c
## End(No test)



