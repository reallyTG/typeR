library(fChange)


### Name: LongRun
### Title: Long Run Covariance Operator Estimation for Functional Time
###   Series
### Aliases: LongRun

### ** Examples

# Generate FAR(1) process
fdata = fun_AR(n=100, nbasis=31, order=1, kappa=0.9)
# Estimate the Long run covrariance
C_hat = LongRun(fdata, h=2)
C_hat$e_fun # eigenfunctions of Long Run Cov
C_hat$e_val # eigenvalues of Long Run Cov
C_hat$covm # Estimated covariance matrix




