library(VGAM)


### Name: yulesimon
### Title: Yule-Simon Family Function
### Aliases: yulesimon
### Keywords: models regression

### ** Examples

ydata <- data.frame(x2 = runif(nn <- 1000))
ydata <- transform(ydata, y = ryules(nn, shape = exp(1.5 - x2)))
with(ydata, table(y))
fit <- vglm(y ~ x2, yulesimon, data = ydata, trace = TRUE)
coef(fit, matrix = TRUE)
summary(fit)



