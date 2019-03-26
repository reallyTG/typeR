library(jmdem)


### Name: jmdem.summaries
### Title: Accessing Joint Mean and Dispersion Effect Model Fits
### Aliases: family.jmdem formula.jmdem residuals.jmdem

### ** Examples

## The jmdem(...) example
MyData <- simdata.jmdem.sim(mformula = y ~ x, dformula = ~ z, 
                            mfamily = poisson(), 
                            dfamily = Gamma(link = "log"), 
                            beta.true = c(0.5, 4), 
                            lambda.true = c(2.5, 3), n = 100)
                            
fit <- jmdem(mformula = y ~ x, dformula = ~ z, data = MyData, 
             mfamily = poisson, dfamily = Gamma(link = "log"), 
             dev.type = "deviance", method = "CG")

coef(fit)
plot(resid(fit), fitted(fit))
abline(h = 0, lty = 2, col = "gray")



