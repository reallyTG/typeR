library(coga)


### Name: dcoga_approx
### Title: Convolution of Gamma distribuitons (Approximation Method)
### Aliases: dcoga_approx pcoga_approx

### ** Examples

## Example 1: Correctness check
set.seed(123)
## do grid
y <- rcoga(100000, c(3,4,5), c(2,3,4))
grid <- seq(0, 15, length.out=100)
## calculate pdf and cdf
pdf <- dcoga_approx(grid, shape=c(3,4,5), rate=c(2,3,4))
cdf <- pcoga_approx(grid, shape=c(3,4,5), rate=c(2,3,4))

## plot pdf
plot(density(y), col="blue")
lines(grid, pdf, col="red")

## plot cdf
plot(ecdf(y), col="blue")
lines(grid, cdf, col="red")

## Example 2: Show parameter recycling
## these pairs give us the same results
dcoga_approx(1:5, c(1, 2), c(1, 3, 4, 2, 5))
dcoga_approx(1:5, c(1, 2, 1, 2, 1), c(1, 3, 4, 2, 5))

pcoga_approx(1:5, c(1, 3, 5, 2, 2), c(3, 5))
pcoga_approx(1:5, c(1, 3, 5, 2, 2), c(3, 5, 3, 5, 3))




