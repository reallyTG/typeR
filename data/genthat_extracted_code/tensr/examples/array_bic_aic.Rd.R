library(tensr)


### Name: array_bic_aic
### Title: Calculate the AIC and BIC.
### Aliases: array_bic_aic
### Keywords: likelihood

### ** Examples

# Generate random array data with first mode having unstructured covariance
#  second having diagonal covariance structure and third mode having identity
#  covariance structure.
set.seed(857)
p <- c(4, 4, 4)
Z <- array(stats::rnorm(prod(p)), dim = p)
Y <- atrans(Z, list(tensr:::rwish(diag(p[1])), diag(1:p[2]), diag(p[3])))

# Use holq() to fit various models.
false_fit1 <- holq(Y, mode_rep = 1:3) ## identity for all modes
false_fit2 <- holq(Y, mode_rep = 2:3) ## unstructured first mode
true_fit <- holq(Y, mode_rep = 3, mode_diag = 2) ## correct model

# Get AIC and BIC values.
false_aic1 <- array_bic_aic(false_fit1$sig ^ 2, p, mode_ident = 1:length(p))
false_aic2 <- array_bic_aic(false_fit2$sig ^ 2, p, mode_ident = 2:length(p),
                            mode_unstructured = 1)
true_aic <- array_bic_aic(true_fit$sig ^ 2, p, mode_ident = 2:length(p), mode_diag = 1)

# Plot the results.
plot(c(false_aic1$AIC, false_aic2$AIC, true_aic$AIC), type = "l",
     xaxt = "n", xlab = "Model", ylab = "AIC", main = "AIC")
axis(side = 1, at = 1:3, labels = c("Wrong Model 1", "Wrong Model 2", "Right Model"))

plot(c(false_aic1$BIC, false_aic2$BIC, true_aic$BIC), type = "l", xaxt = "n",
     xlab = "Model", ylab = "BIC", main = "BIC")
axis(side = 1, at = 1:3, labels = c("Wrong Model 1", "Wrong Model 2", "Right Model"))



