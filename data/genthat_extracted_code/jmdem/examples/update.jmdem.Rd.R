library(jmdem)


### Name: update.jmdem
### Title: Update and Re-fit a JMDEM Call
### Aliases: update.jmdem

### ** Examples

## Example in jmdem(...): Update the dispersion fitting based on Pearson
## residuals and change from Nelder-Mead to BFGS as optimisation method.
MyData <- simdata.jmdem.sim(mformula = y ~ x, dformula = ~ z, 
                            mfamily = poisson(), 
                            dfamily = Gamma(link = "log"), 
                            beta.true = c(0.5, 4), 
                            lambda.true = c(2.5, 3), n = 100)
                            
fit <- jmdem(mformula = y ~ x, dformula = ~ z, data = MyData, 
             mfamily = poisson, dfamily = Gamma(link = "log"), 
             dev.type = "deviance", method = "CG")
             
update(fit, dev.type = "pearson", method = "BFGS")



