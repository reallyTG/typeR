library(robmed)


### Name: fit_mediation
### Title: (Robustly) fit a mediation model
### Aliases: fit_mediation print.fit_mediation summary.reg_fit_mediation
###   summary.cov_fit_mediation
### Keywords: multivariate

### ** Examples

data("BSG2014")
fit <- fit_mediation(BSG2014,
                     x = "ValueDiversity",
                     y = "TeamCommitment",
                     m = "TaskConflict")
test <- test_mediation(fit)
summary(test)




