library(ciTools)


### Name: add_probs.glm
### Title: Response Probabilities for Generalized Linear Models
### Aliases: add_probs.glm

### ** Examples

# Fit a Poisson model
fit <- glm(dist ~ speed, data = cars, family = "poisson")

# Determine the probability that a new dist is less than 20, given
# the Poisson model.
add_probs(cars, fit, q = 20)

# Determine the probability that a new dist is greater than 20,
# given the Poisson model.
add_probs(cars, fit, q = 30, comparison = ">")

# Determine the probability that a new dist is greater than or
# equal to 20, given the Poisson model.
add_probs(cars, fit, q = 30, comparison = ">=")

# Fit a logistic model
fit2 <- glm(I(dist > 30) ~ speed, data = cars, family = "binomial")
add_probs(cars, fit2, q = 0, comparison = "=")
add_probs(cars, fit2, q = 1, comparison = "=")




