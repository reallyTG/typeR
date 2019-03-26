library(robmed)


### Name: summary.test_mediation
### Title: Summary of results from (robust) mediation analysis
### Aliases: summary.test_mediation summary.boot_test_mediation
###   summary.sobel_test_mediation
### Keywords: utilities

### ** Examples

data("BSG2014")
test <- test_mediation(BSG2014,
                       x = "ValueDiversity",
                       y = "TeamCommitment",
                       m = "TaskConflict")
summary(test)




