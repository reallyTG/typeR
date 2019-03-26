library(pracma)


### Name: findzeros
### Title: Find All Roots
### Aliases: findzeros
### Keywords: math

### ** Examples

f1 <- function(x) sin(pi/x)
findzeros(f1, 1/10, 1)
#  0.1000000  0.1111028  0.1250183  0.1428641  0.1666655
#  0.2000004  0.2499867  0.3333441  0.4999794  1.0000000

f2 <- function(x) 0.5*(1 + sin(10*pi*x))
findzeros(f2, 0, 1)
#  0.15  0.35  0.55  0.75  0.95

f3 <- function(x) sin(pi/x) + 1
findzeros(f3, 0.1, 0.5)
# 0.1052632 0.1333333 0.1818182 0.2857143

f4 <- function(x) sin(pi/x) - 1
findzeros(f4, 0.1, 0.5)
# 0.1176471 0.1538462 0.2222222 0.4000000

## Not run: 
##D # Dini function
##D Dini <- function(x) x * besselJ(x, 1) + 3 * besselJ(x, 0)
##D findzeros(Dini, 0, 100, n = 128)
##D ezplot(Dini, 0, 100, n = 512)
## End(Not run)



