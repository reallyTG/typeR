library(fpc)


### Name: tdecomp
### Title: Root of singularity-corrected eigenvalue decomposition
### Aliases: tdecomp
### Keywords: array

### ** Examples

x <- rnorm(10)
y <- rnorm(10)
z <- cov(cbind(x,y))
round(tdecomp(z),digits=2)



