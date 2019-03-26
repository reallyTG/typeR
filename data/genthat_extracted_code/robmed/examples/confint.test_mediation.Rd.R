library(robmed)


### Name: confint.test_mediation
### Title: Confidence intervals for (robust) mediation analysis
### Aliases: confint.test_mediation confint.boot_test_mediation
###   confint.sobel_test_mediation
### Keywords: utilities

### ** Examples

data("BSG2014")

# run fast and robust bootstrap test
robust_boot <- test_mediation(BSG2014,
                              x = "ValueDiversity",
                              y = "TeamCommitment",
                              m = "TaskConflict",
                              robust = TRUE)
confint(robust_boot, other = "boot")

# run standard bootstrap test
standard_boot <- test_mediation(BSG2014,
                                x = "ValueDiversity",
                                y = "TeamCommitment",
                                m = "TaskConflict",
                                robust = FALSE)
confint(standard_boot, other = "theory")




