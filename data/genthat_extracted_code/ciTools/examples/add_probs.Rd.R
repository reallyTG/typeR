library(ciTools)


### Name: add_probs
### Title: Add Regression Probabilities to Data Frames
### Aliases: add_probs

### ** Examples

# Define a model
fit <- lm(dist ~ speed, data = cars)

# Calculate the probability that the probability that a new
# dist is less than 20 (Given the model).
add_probs(cars, fit, q = 20)

# Calculate the probability that a new
# dist is greater than 20 (Given the model).
add_probs(cars, fit, q = 20, comparison = ">")

# Try a different model fit.
fit2 <- glm(dist ~ speed, family = "poisson", data = cars)
add_probs(cars, fit2, q = 20)

# Try a different model fit.
fit3 <- lme4::lmer(Reaction ~ Days + (1|Subject), data = lme4::sleepstudy)
add_probs(lme4::sleepstudy, fit3, q = 300, type = "parametric")

# As above, but do not condition on the random effects.
add_probs(lme4::sleepstudy, fit3, q = 300, type = "parametric", includeRanef = FALSE)




