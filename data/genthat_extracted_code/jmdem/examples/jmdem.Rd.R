library(jmdem)


### Name: jmdem
### Title: Fitting Joint Mean and Dispersion Effects Models
### Aliases: jmdem jmdem.fit

### ** Examples

## Fit poisson counts by unnested mean and dispersion submodels. 
## Use log-links for both submodels. Set dispersion fitting based 
## on deviance residuals. Use conjugate gradient (CG) as 
## optimisation method.
MyData <- simdata.jmdem.sim(mformula = y ~ x, dformula = ~ z, 
                            mfamily = poisson(), 
                            dfamily = Gamma(link = "log"), 
                            beta.true = c(0.5, 4), 
                            lambda.true = c(2.5, 3), n = 100)
                            
fit <- jmdem(mformula = y ~ x, dformula = ~ z, data = MyData, 
             mfamily = poisson, dfamily = Gamma(link = "log"), 
             dev.type = "deviance", method = "CG")
      
## Fit Gaussian responses by nesting dispersion submodel in the mean 
## submodel. Use default link for both submodels. Set dispersion fitting 
## based on pearson residuals. Use quasi-Newton (BFGS) as optimisation 
## method. Adjust degrees of freedom for the likelihood function.
MyData <- simdata.jmdem.sim(mformula = y ~ x + delta, dformula = ~ z, 
                            mfamily = gaussian(), 
                            dfamily = Gamma(link = "log"), 
                            beta.true = c(0.5, 4, 1), 
                            lambda.true = c(2.5, 3), n = 100)

fit <- jmdem(mformula = y ~ x + delta, dformula = ~ z, data = MyData, 
             mfamily = gaussian, dfamily = Gamma, dev.type = "pearson", 
             method = "BFGS", df.adj = TRUE)



