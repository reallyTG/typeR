library(mc2d)


### Name: tornado
### Title: Computes Correlation between Inputs and Output in a mc Object
###   (tornado) in the Variability Dimension;
### Aliases: tornado print.tornado
### Keywords: univar

### ** Examples

data(total)
tornado(total, 2, "complete.obs", "spearman", c(0.025, 0.975))
tornado(total, 4, "pairwise.complete.obs", "spearman", c(0.025, 0.975))
tornado(total, 6, "complete.obs", "kendall", c(0.025, 0.975))
tornado(total, 8, "complete.obs", "spearman", c(0.025, 0.975))
(y <- tornado(total, 10, "complete.obs", "spearman", c(0.025, 0.975)))
plot(y)




