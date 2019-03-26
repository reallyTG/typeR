library(mrfDepth)


### Name: symtest
### Title: Test for angular symmetry around a specified center for
###   bivariate data
### Aliases: symtest
### Keywords: multivariate

### ** Examples

# Perform the test on a simple data example.
data(cardata90)
symtest(x = cardata90, z = hdepthmedian(cardata90)$median)
plot(cardata90)



