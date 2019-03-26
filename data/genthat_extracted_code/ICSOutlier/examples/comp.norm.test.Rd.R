library(ICSOutlier)


### Name: comp.norm.test
### Title: Selection of Nonnormal Invariant Components Using Marginal
###   Normality Tests
### Aliases: comp.norm.test
### Keywords: multivariate

### ** Examples

Z <- rmvnorm(1000, rep(0, 6))
# Add 20 outliers on the first component
Z[1:20, 1] <- Z[1:20, 1] + 10
pairs(Z)
icsZ <- ics2(Z)
# The shift located outliers can be displayed in one dimension
comp.norm.test(icsZ)
# Only one invariant component is non normal and selected.
comp.norm.test(icsZ, test = "bo")

# Example with no outlier
Z0 <- rmvnorm(1000, rep(0, 6))
pairs(Z0)
icsZ0 <- ics2(Z0)
# Should select no component
comp.norm.test(icsZ0, level = 0.01)$index




