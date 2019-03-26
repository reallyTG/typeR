library(ggeffects)


### Name: new_data
### Title: Create a data frame from all combinations of predictor values
### Aliases: new_data

### ** Examples

data(efc)
fit <- lm(barthtot ~ c12hour + neg_c_7 + c161sex + c172code, data = efc)
new_data(fit, c("c12hour [meansd]", "c161sex"))

nd <- new_data(fit, c("c12hour [meansd]", "c161sex"))
pr <- predict(fit, type = "response", newdata = nd)
nd$predicted <- pr
nd

# compare to
ggpredict(fit, c("c12hour [meansd]", "c161sex"))




