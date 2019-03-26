library(VGAM)


### Name: oipospoisson
### Title: One-inflated Positive Poisson Distribution Family Function
### Aliases: oipospoisson
### Keywords: models regression

### ** Examples
 set.seed(1)
pdata <- data.frame(x2 = runif(nn <- 1000))  # Artificial data
pdata <- transform(pdata, pstr1 = 0.5, lambda = exp(3 - x2))
pdata <- transform(pdata, y1 = roipospois(nn, lambda, pstr1 = pstr1))
with(pdata, table(y1))
fit1 <- vglm(y1 ~ x2, oipospoisson, data = pdata, trace = TRUE)
coef(fit1, matrix = TRUE)



