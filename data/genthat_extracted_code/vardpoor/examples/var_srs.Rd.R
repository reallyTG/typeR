library(vardpoor)


### Name: var_srs
### Title: The estimation of the simple random sampling.
### Aliases: var_srs
### Keywords: variance

### ** Examples

Ys <- matrix(rchisq(10, 3), 10, 1)
ws <- c(rep(2, 5), rep(3, 5))
var_srs(Ys, ws)



