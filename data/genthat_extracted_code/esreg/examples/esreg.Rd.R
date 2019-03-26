library(esreg)


### Name: esreg
### Title: Joint Quantile and Expected Shortfall Regression
### Aliases: esreg esreg.formula esreg.default

### ** Examples

# Simulate data (DGP-(2) in the linked paper)
set.seed(0)
x <- rchisq(1000, df=1)
y <- -x + (1 + 0.5 * x) * rnorm(1000)

# True quantile and expected shortfall regression parameters (for alpha=0.025)
alpha=0.025
true_pars <- c(-1.959964, -1.979982, -2.337803, -2.168901)

# Estimate the model using the standard settings
fit <- esreg(y ~ x, alpha=alpha)

# Compare the different variance-covariance estimators
cov1 <- vcov(object=fit, sparsity="iid", cond_var="ind")
cov2 <- vcov(object=fit, sparsity="nid", cond_var="scl_N")
cov3 <- vcov(object=fit, sparsity="nid", cond_var="scl_sp")

print("Comparison of the variance-covariance estimators")
print(rbind(Truth=true_pars,
            Estimate=coef(fit),
            SE_iid_ind=sqrt(diag(cov1)),
            SE_nid_N=sqrt(diag(cov2)),
            SE_nid_sp=sqrt(diag(cov3))))

# Compares estimates using different G2 functions
fit1 <- esreg(y ~ x, alpha=alpha, g2=1)
fit2 <- esreg(y ~ x, alpha=alpha, g2=2)
fit3 <- esreg(y ~ x, alpha=alpha, g2=3)
fit4 <- esreg(y ~ x, alpha=alpha, g2=4)
fit5 <- esreg(y ~ x, alpha=alpha, g2=5)
fits <- sapply(list(fit1, fit2, fit3, fit4, fit5), coef)
colnames(fits) <- sapply(1:5, function(i) esreg:::.G_function_names(1, i)[2])
print("Comparison of the five G2 functions")
print(rbind(Truth=true_pars, t(fits)))

# Usage of different covariates
x <- rchisq(1000, df=1)
noise <- rnorm(1000)
y <- -x + (1 + 0.5 * x) * rnorm(1000)
fit <- esreg(y ~ x | x + noise, alpha=0.025)
print("Using different covariates for VaR and ES")
print(summary(fit))




