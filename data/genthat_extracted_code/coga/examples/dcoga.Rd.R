library(coga)


### Name: dcoga
### Title: Convolution of Gamma Distributions (Exact Method).
### Aliases: dcoga pcoga rcoga

### ** Examples

## Example 1: Correctness check
set.seed(123)
## do grid
y <- rcoga(100000, c(3,4,5), c(2,3,4))
grid <- seq(0, 15, length.out=100)
## calculate pdf and cdf
pdf <- dcoga(grid, shape=c(3,4,5), rate=c(2,3,4))
cdf <- pcoga(grid, shape=c(3,4,5), rate=c(2,3,4))

## plot pdf
plot(density(y), col="blue")
lines(grid, pdf, col="red")

## plot cdf
plot(ecdf(y), col="blue")
lines(grid, cdf, col="red")

## Example 2: Show parameter recycling
## these pairs give us the same results
dcoga(1:5, c(1, 2), c(1, 3, 4, 2, 5))
dcoga(1:5, c(1, 2, 1, 2, 1), c(1, 3, 4, 2, 5))

pcoga(1:5, c(1, 3, 5, 2, 2), c(3, 5))
pcoga(1:5, c(1, 3, 5, 2, 2), c(3, 5, 3, 5, 3))




