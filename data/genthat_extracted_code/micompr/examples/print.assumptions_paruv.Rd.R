library(micompr)


### Name: print.assumptions_paruv
### Title: Print information about the assumptions of the parametric test
### Aliases: print.assumptions_paruv

### ** Examples


# Print information about the assumptions of applying ANOVA to each column
# (dependent variable) of the iris data (i.e. normality of each group and
# homogeneity of variances)
assumptions_paruv(iris[, 1:4], iris[, 5])




