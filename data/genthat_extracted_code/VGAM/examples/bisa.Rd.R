library(VGAM)


### Name: bisa
### Title: Birnbaum-Saunders Distribution Family Function
### Aliases: bisa
### Keywords: models regression

### ** Examples

bdata1 <- data.frame(x2 = runif(nn <- 1000))
bdata1 <- transform(bdata1, shape = exp(-0.5 + x2), scale = exp(1.5))
bdata1 <- transform(bdata1, y = rbisa(nn, scale, shape))
fit1 <- vglm(y ~ x2, bisa(zero = 1), data = bdata1, trace = TRUE)
coef(fit1, matrix = TRUE)

## Not run: 
##D bdata2 <- data.frame(shape = exp(-0.5), scale = exp(0.5))
##D bdata2 <- transform(bdata2, y = rbisa(nn, scale, shape))
##D fit <- vglm(y ~ 1, bisa, data = bdata2, trace = TRUE)
##D with(bdata2, hist(y, prob = TRUE, ylim = c(0, 0.5), col = "lightblue"))
##D coef(fit, matrix = TRUE)
##D with(bdata2, mean(y))
##D head(fitted(fit))
##D x <- with(bdata2, seq(0, max(y), len = 200))
##D lines(dbisa(x, Coef(fit)[1], Coef(fit)[2]) ~ x, data = bdata2,
##D       col = "orange", lwd = 2) 
## End(Not run)



