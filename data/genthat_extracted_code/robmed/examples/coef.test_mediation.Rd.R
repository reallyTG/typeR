library(robmed)


### Name: coef.test_mediation
### Title: Coefficients in (robust) mediation analysis
### Aliases: coef.test_mediation coef.boot_test_mediation
###   coef.fit_mediation
### Keywords: utilities

### ** Examples

data("BSG2014")

# fit robust mediation model and extract coefficients
fit <- fit_mediation(BSG2014,
                     x = "ValueDiversity",
                     y = "TeamCommitment",
                     m = "TaskConflict")
coef(fit)

# run fast and robust bootstrap test and extract coefficients
test <- test_mediation(fit)
coef(test, type = "data")  # from orignal sample
coef(test, type = "boot")  # means of bootstrap replicates




