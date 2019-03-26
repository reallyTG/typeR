library(ciTools)


### Name: add_probs.lm
### Title: Response Level Probabilities for Linear Models
### Aliases: add_probs.lm

### ** Examples


# Fit a linear model
fit <- lm(dist ~ speed, data = cars)

# Calculate the probability that a new dist will be less than 20,
# given the model.
add_probs(cars, fit, q = 20)

# Calculate the probability that a new dist will be greater than
# 30, given the model.
add_probs(cars, fit, q = 30, comparison = ">")




