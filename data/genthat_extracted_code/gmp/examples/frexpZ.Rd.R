library(gmp)


### Name: frexpZ
### Title: Split Number into Fractional and Exponent of 2 Parts
### Aliases: frexpZ frexp
### Keywords: arith

### ** Examples

frexpZ(1:10)
## and confirm :
with(frexpZ(1:10),  d * 2^exp)
x <- rpois(1000, lambda=100) * (1 + rpois(1000, lambda=16))
X <- as.bigz(x)
stopifnot(all.equal(x, with(frexpZ(x), d* 2^exp)),
          1+floor(log2(x)) == (fx <- frexpZ(x)$exp),
          fx == frexpZ(X)$exp,
          1+floor(log2(X)) == fx
)



