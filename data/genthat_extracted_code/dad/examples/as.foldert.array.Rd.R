library(dad)


### Name: as.foldert.array
### Title: Data frame to foldert
### Aliases: as.foldert.array

### ** Examples

x <- array(c(rep(0, 5), rep(0, 5), rep(0, 5),
             rnorm(5, 2, 1), rnorm(5, 3, 2), rnorm(5, -2, 0.5),
             rnorm(5, 4, 1), rnorm(5, 5, 3), rnorm(5, -3, 1)),
           dim = c(5, 3, 3),
           dimnames = list(1:5, c("z1", "z2", "z3"), c("t1", "t2", "t3")))
# The individuals which were observed are on the 1st dimension,
# the variables are on the 2nd dimension and the times are on the 3rd dimension.
ft <- as.foldert(x, ind = 1, var = 2, time = 3)



