library(VGAM)


### Name: topple
### Title: Topp-Leone Distribution Family Function
### Aliases: topple
### Keywords: models regression

### ** Examples

tdata <- data.frame(y = rtopple(1000, shape = logit(1, inverse = TRUE)))
tfit <- vglm(y ~ 1, topple, data = tdata, trace = TRUE, crit = "coef")
coef(tfit, matrix = TRUE)
Coef(tfit)



