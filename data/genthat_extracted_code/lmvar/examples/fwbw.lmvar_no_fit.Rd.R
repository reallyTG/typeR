library(lmvar)


### Name: fwbw.lmvar_no_fit
### Title: Forward / backward-step model selection for an 'lmvar' object
### Aliases: fwbw.lmvar_no_fit

### ** Examples

# Generate model matrices
set.seed(1820)

n_rows = 1000
n_cols = 4

X_mu = matrix(sample(-9:9, n_rows * n_cols, replace = TRUE), nrow = n_rows, ncol = n_cols)
X_sigma = matrix(sample(-9:9, n_rows * n_cols, replace = TRUE), nrow = n_rows, ncol = n_cols)

column_names = sapply(1:n_cols, function(i_column){paste("column", i_column, sep = "_")})
colnames(X_mu) = column_names
colnames(X_sigma) = paste(column_names, "_s", sep = "")

# Generate betas
beta_mu = sample(c(-1,-0.5, 0.5, 1), n_cols + 1, replace = TRUE)
beta_sigma = sample(c(-1,-0.5, 0.5, 1), n_cols + 1, replace = TRUE)

# Generate response vector
mu = X_mu %*% beta_mu[-1] + beta_mu[1]
log_sigma = X_sigma %*% beta_sigma[-1] + beta_sigma[1]
y = rnorm( n_rows, mean = mu, sd = exp(log_sigma))

# Add columns for cross-terms to model matrices. They have no predictive power for the response y.
X_mu = model.matrix(~ . + 0 + column_1 * ., data = as.data.frame(X_mu))
X_sigma = model.matrix(~ . + 0 , data = as.data.frame(X_sigma))
c( colnames(X_mu), colnames(X_sigma))

# Create lmvar object
fit = lmvar(y, X_mu, X_sigma)

# Check whether backward- / forward step model selection with BIC as criterion manages
# to remove cross-terms
fwbw = fwbw(fit, BIC, control = list(monitor = TRUE))
names(coef(fwbw$object))

# The same with AIC as criterion
fwbw = fwbw(fit, AIC, control = list(monitor = TRUE))
names(coef(fwbw$object))

# Model selection starting with an intercept term only.
fwbw = fwbw(fit, BIC, fw = TRUE)
names(coef(fwbw$object))

# It also works on an object of class 'lmvar_no_fit'
no_fit = lmvar_no_fit(y, X_mu, X_sigma)
fwbw( no_fit, AIC, control = list(monitor = TRUE))




