library(tensr)


### Name: polar
### Title: The left polar decomposition.
### Aliases: polar

### ** Examples

X <- matrix(1:6, nrow = 2)
polar_x <- polar(X)
P <- polar_x$P
Z <- polar_x$Z
P
Z
trim(Z %*% t(Z))
trim(X - P %*% Z)



