library(multipol)


### Name: as.function.multipol
### Title: Coerce a multipol to a function
### Aliases: as.function.multipol as_function_multipol
###   as_function_multipol_vector
### Keywords: array

### ** Examples

a <- as.multipol(array (1:12, c(2,3,2)))

f1 <- as.function(a)
f2 <- as.function(a*a)

x <- matrix(rnorm(15),ncol=3)

f1(x)^2 - f2(x)   #should be zero  [non-trivial!]



