library(VGAM)


### Name: skellam
### Title: Skellam Distribution Family Function
### Aliases: skellam
### Keywords: models regression

### ** Examples

## Not run: 
##D sdata <- data.frame(x2 = runif(nn <- 1000))
##D sdata <- transform(sdata, mu1 = exp(1 + x2), mu2 = exp(1 + x2))
##D sdata <- transform(sdata, y = rskellam(nn, mu1, mu2))
##D fit1 <- vglm(y ~ x2, skellam, data = sdata, trace = TRUE, crit = "coef")
##D fit2 <- vglm(y ~ x2, skellam(parallel = TRUE), data = sdata, trace = TRUE)
##D coef(fit1, matrix = TRUE)
##D coef(fit2, matrix = TRUE)
##D summary(fit1)
##D # Likelihood ratio test for equal means:
##D pchisq(2 * (logLik(fit1) - logLik(fit2)),
##D        df = df.residual(fit2) - df.residual(fit1), lower.tail = FALSE)
##D lrtest(fit1, fit2)  # Alternative
## End(Not run)



