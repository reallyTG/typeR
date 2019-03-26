library(MVT)


### Name: wilson.hilferty
### Title: Wilson-Hilferty transformation
### Aliases: wilson.hilferty
### Keywords: multivariate

### ** Examples

data(companies)
x <- companies
z <- wilson.hilferty(x, center = colMeans(x), cov = cov(x))
par(pty = "s")
qqnorm(z, main = "Transformed distances Q-Q plot")
abline(c(0,1), col = "red", lwd = 2)



