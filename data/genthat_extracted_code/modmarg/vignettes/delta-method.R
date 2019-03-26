## ------------------------------------------------------------------------
library(modmarg)
data(margex)
lg <- glm(outcome ~ treatment * age, data = margex, family = 'binomial')
summary(lg)

## ------------------------------------------------------------------------
# Extract the n x k matrix of data
x <- model.matrix(lg)

# Extract the coefficients from the model (a column vector with k entries)
beta <- matrix(lg$coefficients)

# CONTROL:

# Set treatment and treatment:age to 0 for all observations
x[, "treatment"] <- 0
x[, 'treatment:age'] <- x[, 'treatment'] * x[, 'age']

# Get linear predictors
pred_ctl <- x %*% beta

# Apply the inverse link function to get predicted probabilities
pp_ctl <- 1 / (1 + exp(-pred_ctl))

# Get the average predicted probability
mean_pp_ctl <- mean(pp_ctl)

# TREATMENT:

# Set treatment to 1 and treatment:age to age for all observations
x[, "treatment"] <- 1
x[, 'treatment:age'] <- x[, 'treatment'] * x[, 'age']

# Get linear predictors
pred_treat <- x %*% beta

# Apply the inverse link function to get predicted probabilities
pp_treat <- 1 / (1 + exp(-pred_treat))

# Get the average predicted probability
mean_pp_treat <- mean(pp_treat)

# RESULTS:

mean_pp_ctl
mean_pp_treat

## ------------------------------------------------------------------------
# Get the data
x <- model.matrix(lg)

# CONTROL ERROR

# Apply the derivative of the inverse link function to the linear predictors
deriv <- as.vector(exp(-pred_ctl) / (1 + exp(-pred_ctl))^2)

# Set treatment to 0
x[, 'treatment'] <- 0
x[, 'treatment:age'] <- x[, 'treatment'] * x[, 'age']

# Complete the chain rule by matrix-multiplying the derivatives by the data,
# now we have the jacobian
j <- deriv %*% x / nrow(x)

# The variance of our estimate is the cross product of the jacobian and the model's
# variance-covariance matrix
variance <- j %*% vcov(lg) %*% t(j)

# The error is the square root of that
se_ctl <- sqrt(diag(variance))

# TREATMENT ERROR: same logic

deriv <- as.vector(exp(-pred_treat) / (1 + exp(-pred_treat))^2)

x <- model.matrix(lg)

x[, 'treatment'] <- 1
x[, 'treatment:age'] <- x[, 'treatment'] * x[, 'age']

j <- deriv %*% x / nrow(x)

variance <- j %*% vcov(lg) %*% t(j)
se_treat <- sqrt(diag(variance))

se_ctl
se_treat

## ------------------------------------------------------------------------
result <- data.frame(
  Label = c("treatment = 0", "treatment = 1"),
  Margin = c(mean_pp_ctl, mean_pp_treat),
  Standard.Error = c(se_ctl, se_treat)
)

result

## ------------------------------------------------------------------------
marg <- modmarg::marg(mod = lg, var_interest = 'treatment')
marg[[1]][, c("Label", "Margin", "Standard.Error")]

