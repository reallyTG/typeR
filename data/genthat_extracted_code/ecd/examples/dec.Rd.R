library(ecd)


### Name: dec
### Title: The Elliptic Distribution
### Aliases: dec pec qec rec
### Keywords: distribution

### ** Examples

d <- ecd(with.quantile=TRUE)
x <- seq(-20, 20, by=5)
dec(x,d)
pec(x,d)
p <- c(0.0001, 0.001, 0.01, 0.99, 0.999, 0.9999)
qec(p,d)
rec(100,d)



