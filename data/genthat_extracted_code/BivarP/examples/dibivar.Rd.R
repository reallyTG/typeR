library(BivarP)


### Name: dibivar
### Title: Probability distribution function values based the Archimedean
###   copula
### Aliases: dibivar
### Keywords: ~kwd1 ~kwd2

### ** Examples

x <- seq(0, 100, 5)
y <- seq(0, 100, 4)
pxy <- dibivar(x, y, c(1.5, 50, 1.3, 50), 5, c("weibull", "weibull"), "gumbel")
colnames(pxy) <- x
rownames(pxy) <- y
contour(y, x, pxy, xlab="y", ylab="x")



