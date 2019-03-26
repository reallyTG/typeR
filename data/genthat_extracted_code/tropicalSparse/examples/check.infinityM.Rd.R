library(tropicalSparse)


### Name: check.infinityM
### Title: Check Infinity in Matrix
### Aliases: check.infinityM

### ** Examples

a <- matrix(data = c(2, Inf, Inf, 0, Inf, Inf, Inf, 10, Inf),
nrow = 3, ncol = 3, byrow = TRUE)
check.infinityM(a, 'minplus')




