library(coreSim)


### Name: qi_builder
### Title: Find quantities of interest from generalized linear models
### Aliases: qi_builder

### ** Examples

library(car)

## Normal linear model
m1 <- lm(prestige ~ education + type, data = Prestige)

# Using observed data as scenarios
linear_qi_obs <- qi_builder(m1)

# Create fitted values
fitted_df_1 <- expand.grid(education = 6:16, typewc = 1)

linear_qi <- qi_builder(m1, newdata = fitted_df_1)

# Manually supply coefficient means and covariance matrix
coefs <- coef(m1)
vcov_matrix <- vcov(m1)

linear_qi_custom_mu_Sigma <- qi_builder(mu = coefs, Sigma = vcov_matrix,
                                 newdata = fitted_df_1)

## Logistic regression
# Load data
data(Admission)
Admission$rank <- as.factor(Admission$rank)

# Estimate model
m2 <- glm(admit ~ gre + gpa + rank, data = Admission, family = 'binomial')

# Specify fitted values
m2_fitted <- expand.grid(gre = seq(220, 800, by = 10), gpa = c(2, 4),
                         rank = '4')

# Function to find predicted probabilities from logistic regression models
pr_function <- function(x) 1 / (1 + exp(-x))

# Find quantity of interest
logistic_qi_1 <- qi_builder(m2, m2_fitted, FUN = pr_function)

logistic_qi_2 <- qi_builder(m2, m2_fitted, FUN = pr_function,
                         slim = TRUE)




