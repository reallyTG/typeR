library(kolmim)


### Name: pkolm
### Title: Kolmogorov Dn Distribution
### Aliases: pkolm

### ** Examples

n <- 100
x <- 1:100 / 500
plot(x, sapply(x, function (x) pkolm(x, n)), type='l')

# Wang et al. approximation
s <- x ^ 2 * n
ps <- pmax(0, 1 - 2 * exp(-(2.000071 + .331 / sqrt(n) + 1.409 / n) * s))
lines(x, ps, lty=2)



