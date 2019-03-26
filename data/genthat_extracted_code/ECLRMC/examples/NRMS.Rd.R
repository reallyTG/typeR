library(ECLRMC)


### Name: NRMS
### Title: Normalized Root Mean Square (NRMS) value of two matrices for
###   evaluating their similarity (lower is better)
### Aliases: NRMS

### ** Examples

x = matrix(c(5.1, 4.9, NA, 4.6, 3.5, 3.0, 3.2, 3.1, 1.4, NA, 1.3, 1.5), byrow = TRUE, ncol=4)
a = ECLRMC(x, beta = 0.2)
b = LRMC(x)
NRMS(a,b)



