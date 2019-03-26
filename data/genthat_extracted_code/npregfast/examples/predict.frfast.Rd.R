library(npregfast)


### Name: predict.frfast
### Title: Prediction from fitted 'frfast' model
### Aliases: predict.frfast

### ** Examples

library(npregfast)
data(barnacle)

# Nonparametric regression without interactions
fit <- frfast(DW ~ RC, data = barnacle, nboot = 100)
nd <- data.frame(RC = c(10, 14, 18))
predict(fit, newdata = nd)

# Nonparametric regression with interactions
# fit2 <- frfast(DW ~ RC : F, data = barnacle, nboot = 100)
# nd2 <- data.frame(RC = c(10, 15, 20))
# predict(fit2, newdata = nd2)
# predict(fit2, newdata = nd2, der = 0, fac = "barca")
 



