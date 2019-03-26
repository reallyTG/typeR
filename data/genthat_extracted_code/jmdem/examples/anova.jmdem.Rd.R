library(jmdem)


### Name: anova.jmdem
### Title: Analysis of Deviance for Joint Mean and Dispersion Effect Models
###   Fits
### Aliases: anova.jmdem

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
              
## Run a partial analysis (type 3) with Wald test
anova(fit, test = "Wald", type = 3)



