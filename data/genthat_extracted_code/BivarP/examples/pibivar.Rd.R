library(BivarP)


### Name: pibivar
### Title: The CDF values based the Archimedean copula
### Aliases: pibivar
### Keywords: ~kwd1 ~kwd2

### ** Examples

x <- seq(0, 100, 5)
y <- seq(0, 100, 4)
Fxy <- pibivar(x, y, c(1.5, 50, 1.3, 50), 5, c("weibull", "weibull"), "gumbel")
colnames(Fxy) <- x
rownames(Fxy) <- y
contour(y, x, Fxy, xlab="y", ylab="x")



