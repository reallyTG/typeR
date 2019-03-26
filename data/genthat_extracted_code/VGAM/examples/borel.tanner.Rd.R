library(VGAM)


### Name: borel.tanner
### Title: Borel-Tanner Distribution Family Function
### Aliases: borel.tanner
### Keywords: models regression

### ** Examples

bdata <- data.frame(y = rbort(n <- 200))
fit <- vglm(y ~ 1, borel.tanner, data = bdata, trace = TRUE, crit = "c")
coef(fit, matrix = TRUE)
Coef(fit)
summary(fit)



