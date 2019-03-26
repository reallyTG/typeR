library(jmdem)


### Name: score.jmdem, wald.jmdem
### Title: Asymptotic tests for fits of joint mean and dispersion effects
###   models
### Aliases: score.jmdem wald.jmdem

### ** Examples

## Example in jmdem(...)
MyData <- simdata.jmdem.sim(mformula = y ~ x + delta, dformula = ~ z, 
                            mfamily = gaussian(), 
                            dfamily = Gamma(link = "log"), 
                            beta.true = c(0.5, 4, 1), 
                            lambda.true = c(2.5, 3), n = 100)

fit <- jmdem(mformula = y ~ x + delta, dformula = ~ z, data = MyData, 
             mfamily = gaussian, dfamily = Gamma, dev.type = "pearson", 
             method = "BFGS", df.adj = TRUE)

fit.1 <- update(fit, mformula = . ~ . - delta)

fit.2 <- update(fit.1, mformula = . ~ . - x)

## conduct a Wald tests
wald.jmdem(fit, fit.1, fit.2)

## should deliver the same results as above
wald.jmdem(object = list(fit, fit.1, fit.2))

## conduct the score test and compute the p-value directly.
raotest <- score.jmdem(fit, fit.2)
pchisq(raotest, df = abs(df.residual(fit) - df.residual(fit.2)), 
       lower.tail = FALSE)



