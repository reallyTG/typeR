library(VGAM)


### Name: bigamma.mckay
### Title: Bivariate Gamma: McKay's Distribution
### Aliases: bigamma.mckay
### Keywords: models regression

### ** Examples

shape1 <- exp(1); shape2 <- exp(2); scalepar <- exp(3)
mdata <- data.frame(y1 = rgamma(nn <- 1000, shape = shape1, scale = scalepar))
mdata <- transform(mdata, zedd = rgamma(nn, shape = shape2, scale = scalepar))
mdata <- transform(mdata, y2 = y1 + zedd)  # Z is defined as Y2-y1|Y1=y1
fit <- vglm(cbind(y1, y2) ~ 1, bigamma.mckay, data = mdata, trace = TRUE)
coef(fit, matrix = TRUE)
Coef(fit)
vcov(fit)

colMeans(depvar(fit))  # Check moments
head(fitted(fit), 1)



