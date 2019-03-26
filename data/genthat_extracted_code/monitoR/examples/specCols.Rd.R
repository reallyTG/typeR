library(monitoR)


### Name: specCols
### Title: Color Vectors for Spectrograms
### Aliases: gray.1 gray.2 gray.3 rainbow.1 topo.1 specCols
### Keywords: color

### ** Examples

spec.test <- function(mat, spec.col) image(z = t(mat), col = spec.col)

mat <- matrix(1:30, ncol = 6, byrow = TRUE)

spec.test(mat = mat, spec.col = gray.1())
spec.test(mat = mat, spec.col = gray.2())
spec.test(mat = mat, spec.col = gray.3())
spec.test(mat = mat, spec.col = rainbow.1())
spec.test(mat = mat, spec.col = topo.1())

## Not run: 
##D # Colors are defined as:
##D gray.1 <- function(n = 30) gray(seq(1, 0, length.out = n))
##D gray.2 <- function(n = 30) gray(1-seq(0, 1, length.out = n)^2)
##D gray.3 <- function(n = 30) gray(1-seq(0, 1, length.out = n)^3)
##D rainbow.1 <- function(n = 15) rev(rainbow(n))
##D topo.1 <- function(n = 12) rev(topo.colors(n))
## End(Not run)



