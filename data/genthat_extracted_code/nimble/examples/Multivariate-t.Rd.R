library(nimble)


### Name: Multivariate-t
### Title: The Multivariate t Distribution
### Aliases: Multivariate-t dmvt_chol multivariate-t mvt rmvt_chol

### ** Examples

mu <- c(-10, 0, 10)
scalemat <- matrix(c(1, .9, .3, .9, 1, -0.1, .3, -0.1, 1), 3)
ch <- chol(scalemat)
x <- rmvt_chol(1, mu, ch, df = 1, prec_param = FALSE)
dmvt_chol(x, mu, ch, df = 1, prec_param = FALSE)




