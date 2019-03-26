library(robmed)


### Name: retest
### Title: Retest for mediation
### Aliases: retest retest.boot_test_mediation retest.sobel_test_mediation
### Keywords: multivariate

### ** Examples

data("BSG2014")

# run fast and robust bootstrap test
test <- test_mediation(BSG2014,
                       x = "ValueDiversity",
                       y = "TeamCommitment",
                       m = "TaskConflict")
summary(test)

# now compute 97.5% confidence interval
retest(test, level = 0.975)




