library(robmed)


### Name: reg_control
### Title: Tuning parameters for MM-regression
### Aliases: reg_control
### Keywords: regression

### ** Examples

data("BSG2014")

# run fast and robust bootstrap test
ctrl <- reg_control(efficiency = 0.95)
test <- test_mediation(BSG2014,
                       x = "ValueDiversity",
                       y = "TeamCommitment",
                       m = "TaskConflict",
                       control = ctrl)
summary(test)




