library(micompr)


### Name: assumptions_paruv
### Title: Determine the assumptions for the parametric comparison test
### Aliases: assumptions_paruv

### ** Examples


# Determine the assumptions of applying ANOVA to each column (dependent
# variable) of the iris data (i.e. normality of each group and homogeneity of
# variances)
a <- assumptions_paruv(iris[, 1:4], iris[, 5])




