library(MXM)


### Name: Permutation based p-value for the Pearson correlation coefficient
### Title: Permutation based p-value for the Pearson correlation
###   coefficient
### Aliases: permcor permcorrels
### Keywords: Permutation test conditional independence test

### ** Examples

MXM::permcor(iris[, 1], iris[, 2], R = 9999)
x <- matrix(rnorm(50 * 2000), ncol = 2000)
a <- permcorrels(iris[1:50, 1], x)



