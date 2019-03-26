library(BivarP)


### Name: subivar
### Title: Survival function values based the Archimedean copula
### Aliases: subivar
### Keywords: ~kwd1 ~kwd2

### ** Examples

x <- seq(0, 100, 5)
y <- seq(0, 100, 4)
Sxy <- subivar(x, y, c(1.5, 50, 1.3, 50), 5, c("weibull", "weibull"), "gumbel")
colnames(Sxy) <- x
rownames(Sxy) <- y
contour(y, x, Sxy, xlab="y", ylab="x")



