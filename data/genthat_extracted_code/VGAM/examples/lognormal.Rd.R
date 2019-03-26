library(VGAM)


### Name: lognormal
### Title: Lognormal Distribution
### Aliases: lognormal
### Keywords: models regression

### ** Examples

ldata2 <- data.frame(x2 = runif(nn <- 1000))
ldata2 <- transform(ldata2, y1 = rlnorm(nn, mean = 1 + 2 * x2, sd = exp(-1)),
                            y2 = rlnorm(nn, mean = 1, sd = exp(-1 + x2)))
fit1 <- vglm(y1 ~ x2, lognormal(zero = 2), data = ldata2, trace = TRUE)
fit2 <- vglm(y2 ~ x2, lognormal(zero = 1), data = ldata2, trace = TRUE)
coef(fit1, matrix = TRUE)
coef(fit2, matrix = TRUE)



