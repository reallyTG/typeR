library(micompr)


### Name: plot.assumptions_paruv
### Title: Plot _p_-values for testing the assumptions of the parametric
###   tests used in output comparison
### Aliases: plot.assumptions_paruv

### ** Examples


# Plot the Shapiro-Wilk and Bartlett test p-values for each dependent
# variable of the iris data
plot(assumptions_paruv(iris[, 1:4], iris[, 5]))

# Plot the same data with logarithmic scale for p-values
plot(assumptions_paruv(iris[, 1:4], iris[, 5]), log = "y")




