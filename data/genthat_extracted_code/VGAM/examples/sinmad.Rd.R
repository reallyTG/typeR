library(VGAM)


### Name: sinmad
### Title: Singh-Maddala Distribution Family Function
### Aliases: sinmad
### Keywords: models regression

### ** Examples

sdata <- data.frame(y = rsinmad(n = 1000, shape1 = exp(1),
                    scale = exp(2), shape3 = exp(0)))
fit <- vglm(y ~ 1, sinmad(lss = FALSE), data = sdata, trace = TRUE)
fit <- vglm(y ~ 1, sinmad(lss = FALSE, ishape1.a = exp(1)),
            data = sdata, trace = TRUE)
coef(fit, matrix = TRUE)
Coef(fit)
summary(fit)

# Harder problem (has the shape3.q parameter going to infinity)

set.seed(3)
sdata <- data.frame(y1 = rbeta(1000, 6, 6))
# hist(with(sdata, y1))
if (FALSE) {
# These struggle
  fit1 <- vglm(y1 ~ 1, sinmad(lss = FALSE), data = sdata, trace = TRUE)
  fit1 <- vglm(y1 ~ 1, sinmad(lss = FALSE), data = sdata, trace = TRUE,
               crit = "coef")
  Coef(fit1)
}
# Try this remedy:
fit2 <- vglm(y1 ~ 1, sinmad(lss = FALSE, ishape3.q = 3, lshape3.q = "loglog"),
             data = sdata, trace = TRUE, stepsize = 0.05, maxit = 99)
coef(fit2, matrix = TRUE)
Coef(fit2)



