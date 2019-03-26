library(robmed)


### Name: cov_control
### Title: Tuning parameters for Huber M-estimation of location and scatter
### Aliases: cov_control
### Keywords: multivariate

### ** Examples

data("BSG2014")

# run fast and robust bootstrap test
ctrl <- cov_control(prob = 0.95)
test <- test_mediation(BSG2014,
                       x = "ValueDiversity",
                       y = "TeamCommitment",
                       m = "TaskConflict",
                       method = "covariance",
                       control = ctrl)
summary(test)




