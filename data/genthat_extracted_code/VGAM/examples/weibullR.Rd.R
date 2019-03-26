library(VGAM)


### Name: weibullR
### Title: Weibull Distribution Family Function
### Aliases: weibullR
### Keywords: models regression

### ** Examples

wdata <- data.frame(x2 = runif(nn <- 1000))  # Complete data
wdata <- transform(wdata,
            y1 = rweibull(nn, shape = exp(1), scale = exp(-2 + x2)),
            y2 = rweibull(nn, shape = exp(2), scale = exp( 1 - x2)))
fit <- vglm(cbind(y1, y2) ~ x2, weibullR, data = wdata, trace = TRUE)
coef(fit, matrix = TRUE)
vcov(fit)
summary(fit)



