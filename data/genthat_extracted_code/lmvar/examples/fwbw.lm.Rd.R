library(lmvar)


### Name: fwbw.lm
### Title: Forward / backward-step model selection for an object of class
###   'lm'
### Aliases: fwbw.lm

### ** Examples

# Generate model matrix
set.seed(1820)

n_rows = 1000
n_cols = 4

X = matrix(sample(-9:9, n_rows * n_cols, replace = TRUE), nrow = n_rows, ncol = n_cols)

column_names = sapply(1:n_cols, function(i_column){paste("column", i_column, sep = "_")})
colnames(X) = column_names

# Generate betas
beta = sample(c(-1,-0.5, 0.5, 1), n_cols + 1, replace = TRUE)

# Generate response vector
mu = X %*% beta[-1] + beta[1]
y = rnorm( n_rows, mean = mu, sd = 2.5)

# Add columns for cross-terms to model matrix. They have no predictive power for the response y.
X = model.matrix(~ . + 0 + column_1 * ., data = as.data.frame(X))
colnames(X)

# Create model in which cross-terms in X are unrelated to response vector y.
fit = lm(y ~ ., as.data.frame(X), x = TRUE, y = TRUE)

# Check whether model selection with BIC as criterion manages
# to remove cross-terms. Start with the full model. Monitor the iterations.
fwbw = fwbw(fit, BIC, control = list(monitor = TRUE))
names(coef(fwbw$object))

# The same with AIC as criterion. Plot how the AIC develops.
fwbw = fwbw(fit, AIC, control = list(plot = TRUE))
names(coef(fwbw$object))

# Model selection starting with an intercept term only.
fwbw = fwbw(fit, BIC, fw = TRUE)
names(coef(fwbw$object))



