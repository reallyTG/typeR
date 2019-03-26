library(VGAM)


### Name: betaII
### Title: Beta Distribution of the Second Kind
### Aliases: betaII
### Keywords: models regression

### ** Examples

bdata <- data.frame(y = rsinmad(2000, shape1.a = 1, shape3.q = exp(2),
                                scale = exp(1)))  # Not genuine data!
fit <- vglm(y ~ 1, betaII, data = bdata, trace = TRUE)
fit <- vglm(y ~ 1, betaII(ishape2.p = 0.7, ishape3.q = 0.7),
            data = bdata, trace = TRUE)
coef(fit, matrix = TRUE)
Coef(fit)
summary(fit)



