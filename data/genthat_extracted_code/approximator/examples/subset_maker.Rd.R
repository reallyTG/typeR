library(approximator)


### Name: subset_maker
### Title: Create a simple subset object
### Aliases: subset_maker
### Keywords: math

### ** Examples

subset_maker(c(10,4,3))


is.nested(subset_maker(c(4,9,6))) #should be FALSE
is.nested(subset_maker(c(9,6,4))) #should be TRUE




