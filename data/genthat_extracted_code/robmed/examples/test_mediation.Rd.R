library(robmed)


### Name: test_mediation
### Title: (Robust) mediation analysis
### Aliases: test_mediation print.boot_test_mediation
###   print.sobel_test_mediation test_mediation.default
###   test_mediation.fit_mediation robmed indirect
### Keywords: multivariate

### ** Examples

data("BSG2014")
test <- test_mediation(BSG2014,
                       x = "ValueDiversity",
                       y = "TeamCommitment",
                       m = "TaskConflict")
summary(test)




