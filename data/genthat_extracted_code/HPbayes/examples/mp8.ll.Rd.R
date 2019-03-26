library(HPbayes)


### Name: mp8.ll
### Title: Binomial likelihood for a set of Heligman-Pollard Parameters
### Aliases: mp8.ll
### Keywords: misc

### ** Examples

##A set of parameters##
theta <- c(0.06008, 0.31087, 0.34431, 0.00698,
           1.98569, 26.71071, 0.00022, 1.08800)
##Deaths and persons at risk##
lx <- c(1974, 1906, 1860, 1844, 1834, 1823, 1793, 1700, 1549, 1361, 
1181, 1025, 870, 721, 571, 450, 344, 256, 142, 79, 41, 8)
dx <- c(68, 47, 16, 10, 13, 29, 92, 151, 188, 179, 156, 155, 147, 150, 
122, 106, 88, 113, 63, 38, 32, 8)
mp8.ll(theta=theta, nrisk=lx, ndeath=dx)




