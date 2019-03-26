library(jmdem)


### Name: summary.jmdem
### Title: Summarising Joint Mean and Dispersion Effects Model Fits
### Aliases: summary.jmdem print.summary.jmdem

### ** Examples

## Example in jmdem(...)
MyData <- simdata.jmdem.sim(mformula = y ~ x, dformula = ~ z, 
                            mfamily = poisson(), 
                            dfamily = Gamma(link = "log"), 
                            beta.true = c(0.5, 4), 
                            lambda.true = c(2.5, 3), n = 100)
                            
fit <- jmdem(mformula = y ~ x, dformula = ~ z, data = MyData, 
             mfamily = poisson, dfamily = Gamma(link = "log"), 
             dev.type = "deviance", method = "CG")
              
## Summarise fit with correlation matrix
summary(fit, correlation = TRUE, digits = 4)



