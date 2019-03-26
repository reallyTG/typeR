library(VGAM)


### Name: diffzeta
### Title: Differenced Zeta Distribution Family Function
### Aliases: diffzeta
### Keywords: models regression

### ** Examples

odata <- data.frame(x2 = runif(nn <- 1000))  # Artificial data
odata <- transform(odata, shape = loge(-0.25 + x2, inverse = TRUE))
odata <- transform(odata, y1 = rdiffzeta(nn, shape))
with(odata, table(y1))
ofit <- vglm(y1 ~ x2, diffzeta, data = odata, trace = TRUE, crit = "coef")
coef(ofit, matrix = TRUE)



