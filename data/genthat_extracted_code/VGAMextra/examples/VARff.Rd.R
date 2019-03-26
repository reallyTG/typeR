library(VGAMextra)


### Name: VARff
### Title: VGLTSM family function for the Order-p Vector Auto(R)egressive
###   Model
### Aliases: VARff

### ** Examples

set.seed(20170227)
nn <- 60
var.data <- data.frame(x2 = runif(nn, -2.5, 2.5))
var.data <- transform(var.data, y1 = rnorm(nn, 1.5 - 2 * x2, sqrt(exp(1.5))),
                                y2 = rnorm(nn, 1.0 - 1 * x2, sqrt(exp(0.75))),
                                y3 = rnorm(nn, 0.5 + 1 * x2, sqrt(exp(1.0))))

fit.var <- vglm(cbind(y1, y2, y3) ~ x2, VARff(VAR.order = 2),
                trace = TRUE, data = var.data)
coef(fit.var, matrix = TRUE)

summary(fit.var)
vcov(fit.var)



