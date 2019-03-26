library(GMCM)


### Name: colSds
### Title: Row and column standard deviations
### Aliases: colSds rowSds
### Keywords: internal

### ** Examples

x <- matrix(rnorm(50), 10, 5)
GMCM:::colSds(x)
apply(x, 2, sd)  # slower equivalent code
y <- matrix(rnorm(50), 10, 5)
GMCM:::rowSds(y)



