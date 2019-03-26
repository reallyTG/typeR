library(robmed)


### Name: fortify.test_mediation
### Title: Convert (robust) mediation analysis results into a data frame
###   for plotting
### Aliases: fortify.test_mediation fortify.boot_test_mediation
###   fortify.sobel_test_mediation fortify.list
### Keywords: utilities

### ** Examples

data("BSG2014")

# run fast and robust bootstrap test
test <- test_mediation(BSG2014,
                       x = "ValueDiversity",
                       y = "TeamCommitment",
                       m = "TaskConflict")

# data for dot plot
dot <- fortify(test, method = "dot")
plot_mediation(dot)

# data for density plot
density <- fortify(test, method = "density")
plot_mediation(density)




