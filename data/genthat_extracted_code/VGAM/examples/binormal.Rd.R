library(VGAM)


### Name: binormal
### Title: Bivariate Normal Distribution Family Function
### Aliases: binormal
### Keywords: models regression

### ** Examples

set.seed(123); nn <- 1000
bdata <- data.frame(x2 = runif(nn), x3 = runif(nn))
bdata <- transform(bdata, y1 = rnorm(nn, 1 + 2 * x2),
                          y2 = rnorm(nn, 3 + 4 * x2))
fit1 <- vglm(cbind(y1, y2) ~ x2,
             binormal(eq.sd = TRUE), data = bdata, trace = TRUE)
coef(fit1, matrix = TRUE)
constraints(fit1)
summary(fit1)

# Estimated P(Y1 <= y1, Y2 <= y2) under the fitted model
var1  <- loge(2 * predict(fit1)[, "loge(sd1)"], inverse = TRUE)
var2  <- loge(2 * predict(fit1)[, "loge(sd2)"], inverse = TRUE)
cov12 <- rhobit(predict(fit1)[, "rhobit(rho)"], inverse = TRUE)
head(with(bdata, pbinorm(y1, y2,
                         mean1 = predict(fit1)[, "mean1"],
                         mean2 = predict(fit1)[, "mean2"],
                         var1 = var1, var2 = var2, cov12 = cov12)))



