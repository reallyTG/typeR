library(robmed)


### Name: plot_mediation
### Title: Plot (robust) mediation analysis results
### Aliases: plot_mediation plot_mediation.boot_test_mediation
###   plot_mediation.sobel_test_mediation plot_mediation.list
###   plot_mediation.default autoplot.test_mediation plot.test_mediation
### Keywords: hplot

### ** Examples

data("BSG2014")

# run fast and robust bootstrap test
robust_boot <- test_mediation(BSG2014,
                              x = "ValueDiversity",
                              y = "TeamCommitment",
                              m = "TaskConflict",
                              robust = TRUE)

# create plots for robust bootstrap test
plot(robust_boot, method = "dot")
plot(robust_boot, method = "density")

# run standard bootstrap test
standard_boot <- test_mediation(BSG2014,
                                x = "ValueDiversity",
                                y = "TeamCommitment",
                                m = "TaskConflict",
                                robust = FALSE)

# compare robust and standard tests
tests <- list(Robust = robust_boot, Standard = standard_boot)
plot_mediation(tests, method = "dot")
plot_mediation(tests, method = "density")




