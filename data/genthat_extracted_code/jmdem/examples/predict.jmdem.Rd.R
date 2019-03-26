library(jmdem)


### Name: predict.jmdem
### Title: Predict Method for JMDEM Fits
### Aliases: predict.jmdem

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
              
## Predict on the scale of the response variable with standard errors.
predict(fit, type = "response", se.fit = TRUE)

## Predict based on a new observation on the scale of the linear 
## predictors with standard errors.
predict(fit, newdata = data.frame(x = -1.5, z = 100), se.fit = TRUE)




