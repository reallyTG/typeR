library(colorednoise)


### Name: multi_rnorm
### Title: Generate Correlated Normal Random Numbers
### Aliases: multi_rnorm

### ** Examples

mus <- c(0, 3, 5)
sigmas <- matrix(c(1, 0.265, 2.19, 0.265, 0.25, 0.66, 2.19, 0.66, 9), ncol = 3)
mat <- multi_rnorm(100, mus, sigmas)
var(mat)



