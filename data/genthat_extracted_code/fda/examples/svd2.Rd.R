library(fda)


### Name: svd2
### Title: singular value decomposition with automatic error handling
### Aliases: svd2
### Keywords: array

### ** Examples

# example from svd
hilbert <- function(n) { i <- 1:n; 1 / outer(i - 1, i, "+") }
X <- hilbert(9)[, 1:6]
s <- svd(X)

s2 <- svd2(X)
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(s, s2)
## Don't show: 
)
## End(Don't show)



