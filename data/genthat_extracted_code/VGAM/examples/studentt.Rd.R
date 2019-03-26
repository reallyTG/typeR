library(VGAM)


### Name: studentt
### Title: Student t Distribution
### Aliases: studentt studentt2 studentt3
### Keywords: models regression

### ** Examples

tdata <- data.frame(x2 = runif(nn <- 1000))
tdata <- transform(tdata, y1 = rt(nn, df = exp(exp(0.5 - x2))),
                          y2 = rt(nn, df = exp(exp(0.5 - x2))))
fit1 <- vglm(y1 ~ x2, studentt, data = tdata, trace = TRUE)
coef(fit1, matrix = TRUE)

fit2 <- vglm(y1 ~ x2, studentt2(df = exp(exp(0.5))), data = tdata)
coef(fit2, matrix = TRUE)  # df inputted into studentt2() not quite right

fit3 <- vglm(cbind(y1, y2) ~ x2, studentt3, data = tdata, trace = TRUE)
coef(fit3, matrix = TRUE)



