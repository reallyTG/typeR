library(coga)


### Name: dcoga2dim
### Title: Convolution of Two Gamma Distributions (Exact Method).
### Aliases: dcoga2dim pcoga2dim

### ** Examples

## Example 1: Correctness check
set.seed(123)
## do grid
y <- rcoga(100000, c(3,4), c(2,3))
grid <- seq(0, 15, length.out=100)
## calculate pdf and cdf
pdf <- dcoga2dim(grid, 3, 4, 2, 3)
cdf <- pcoga2dim(grid, 3, 4, 2, 3)

## plot pdf
plot(density(y), col="blue")
lines(grid, pdf, col="red")

## plot cdf
plot(ecdf(y), col="blue")
lines(grid, cdf, col="red")

## Example 2: Comparison with `dcoga` and `pcoga`
## these pairs give us the same results
dcoga(1:5, c(1, 2), c(3, 4))
dcoga2dim(1:5, 1, 2, 3, 4)

pcoga(1:5, c(1, 3), c(3, 5))
pcoga2dim(1:5, 1, 3, 3, 5)




