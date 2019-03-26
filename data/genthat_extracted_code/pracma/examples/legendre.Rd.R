library(pracma)


### Name: legendre
### Title: Legendre Functions (Matlab Style)
### Aliases: legendre
### Keywords: math

### ** Examples

x <- c(0.0, 0.1, 0.2)
legendre(2, x)
#      [,1]       [,2]       [,3]
# [1,] -0.5 -0.4850000 -0.4400000
# [2,]  0.0 -0.2984962 -0.5878775
# [3,]  3.0  2.9700000  2.8800000

## Not run: 
##D x <- seq(0, 1, len = 50)
##D L <- legendre(2, x)
##D plot(x, L[1, ], type = "l", col = 1, ylim = c(-2, 3), ylab = "y",
##D                 main = "Legendre Functions of degree 2")
##D lines(x, L[2, ], col = 2)
##D lines(x, L[3, ], col = 3)
##D grid()
## End(Not run)
## Generate Legendre's Polynomial as function
# legendre_P <- function(n, x) {
#     L <- legendre(n, x)
#     return(L[1, ])
# }



