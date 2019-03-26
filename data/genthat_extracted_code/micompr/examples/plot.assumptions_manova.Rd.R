library(micompr)


### Name: plot.assumptions_manova
### Title: Plot _p_-values for testing the multivariate normality
###   assumptions of the MANOVA test
### Aliases: plot.assumptions_manova

### ** Examples


# Plot the Royston test p-value for multivariate normality of each group
# (species) of the iris data
plot(assumptions_manova(iris[, 1:4], iris[, 5]))

# Plot the same data with logarithmic scale for p-values
plot(assumptions_manova(iris[, 1:4], iris[, 5]), log = "y")




