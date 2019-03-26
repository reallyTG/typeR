library(micompr)


### Name: assumptions_manova
### Title: Determine the assumptions for the MANOVA test
### Aliases: assumptions_manova

### ** Examples


# Determine the assumptions of applying MANOVA to the iris data
# (i.e. multivariate normality of each group and homogeneity of covariance
# matrices)
a <- assumptions_manova(iris[, 1:4], iris[, 5])




