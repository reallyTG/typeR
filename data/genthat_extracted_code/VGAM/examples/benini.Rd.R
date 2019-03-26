library(VGAM)


### Name: benini1
### Title: Benini Distribution Family Function
### Aliases: benini1
### Keywords: models regression

### ** Examples

y0 <- 1; nn <- 3000
bdata <- data.frame(y  = rbenini(nn, y0 = y0, shape = exp(2)))
fit <- vglm(y ~ 1, benini1(y0 = y0), data = bdata, trace = TRUE)
coef(fit, matrix = TRUE)
Coef(fit)
fit@extra$y0
c(head(fitted(fit), 1), with(bdata, median(y)))  # Should be equal



