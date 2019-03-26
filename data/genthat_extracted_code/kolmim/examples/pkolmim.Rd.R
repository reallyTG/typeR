library(kolmim)


### Name: pkolmim
### Title: Kolmogorov Dn Distribution
### Aliases: pkolmim

### ** Examples

n <- 100
x <- 1:100 / 500
plot(x, pkolmim(x, n), type='l')

# Wang et al. approximation
s <- x ^ 2 * n
ps <- pmax(0, 1 - 2 * exp(-(2.000071 + .331 / sqrt(n) + 1.409 / n) * s))
lines(x, ps, lty=2)



