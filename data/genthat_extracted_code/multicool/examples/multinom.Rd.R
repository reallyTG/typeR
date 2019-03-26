library(multicool)


### Name: multinom
### Title: Calculate multinomial coefficients
### Aliases: multinom
### Keywords: combinations permutations multinomial

### ** Examples

## An example with a multiset X = (a,a,a,b,b,c)
## There are 3 a s, 2 b s and 1 c, so the answer should be
## (3+2+1)!/(3!2!1!) = 6!/3!2!1! = 60
x = rep(letters[1:3],3:1)
multinom(x)

## in this example x is a vector of counts
## the answer should be the same as above as x = c(3,2,1)
x = rep(letters[1:3],3:1)
x = as.vector(table(x)) #coerce x into a vector of counts
multinom(x, counts = TRUE)


## An example of integer overflow. x is a vector of counts
## c(12,11,8,8,6,5). The true answer from Maple is
## 11,324,718,121,789,252,764,532,876,767,840,000
## The error in the integer based answer is obvious.
## The error using floating point is not, but from Maple is
## 0.705057123232160000e+10
## Thanks to Lev Dashevskiy for calling my attention to this.
## Not run: 
##D x = c(12,11,8,8,6,5)
##D multinom(x, counts = TRUE, useDouble = FALSE)
##D multinom(x, counts = TRUE, useDouble = TRUE)
## End(Not run)



