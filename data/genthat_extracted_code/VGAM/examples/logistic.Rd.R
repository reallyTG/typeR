library(VGAM)


### Name: logistic
### Title: Logistic Distribution Family Function
### Aliases: logistic logistic1 logistic
### Keywords: models regression

### ** Examples

# Location unknown, scale known
ldata <- data.frame(x2 = runif(nn <- 500))
ldata <- transform(ldata, y1 = rlogis(nn, loc = 1 + 5*x2, scale = exp(2)))
fit1 <- vglm(y1 ~ x2, logistic1(scale = exp(2)), data = ldata, trace = TRUE)
coef(fit1, matrix = TRUE)

# Both location and scale unknown
ldata <- transform(ldata, y2 = rlogis(nn, loc = 1 + 5*x2, scale = exp(0 + 1*x2)))
fit2 <- vglm(cbind(y1, y2) ~ x2, logistic, data = ldata, trace = TRUE)
coef(fit2, matrix = TRUE)
vcov(fit2)
summary(fit2)



