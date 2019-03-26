library(ciTools)


### Name: add_ci
### Title: Add Confidence Intervals for Fitted Values to Data Frames
### Aliases: add_ci

### ** Examples

# Fit a linear model
fit <- lm(dist ~ speed, data = cars)
# Make a confidence interval for each observation in cars, and
# append to the data frame
add_ci(cars, fit)

# Make new data
new_data <- cars[sample(NROW(cars), 10), ]
add_ci(new_data, fit)

# Fit a Poisson model
fit2 <- glm(dist ~ speed, family = "poisson", data = cars)
# Append CIs
add_ci(cars, fit2)

# Fit a linear mixed model using lme4
fit3 <- lme4::lmer(Reaction ~ Days + (1|Subject), data = lme4::sleepstudy)
# Append CIs
# Generally, you should use more than 100 bootstrap replicates
add_ci(lme4::sleepstudy, fit3, nSims = 100)

# Fit a logistic model
fit4 <- glm(I(dist > 20) ~ speed, family = "binomial", data = cars)
# Append CIs
add_ci(cbind(cars, I(cars$dist > 20)), fit4)





