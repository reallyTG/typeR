library(VGAM)


### Name: Sinmad
### Title: The Singh-Maddala Distribution
### Aliases: Sinmad dsinmad psinmad qsinmad rsinmad
### Keywords: distribution

### ** Examples

sdata <- data.frame(y = rsinmad(n = 3000, scale = exp(2),
                                shape1 = exp(1), shape3 = exp(1)))
fit <- vglm(y ~ 1, sinmad(lss = FALSE, ishape1.a = 2.1), data = sdata,
            trace = TRUE, crit = "coef")
coef(fit, matrix = TRUE)
Coef(fit)



