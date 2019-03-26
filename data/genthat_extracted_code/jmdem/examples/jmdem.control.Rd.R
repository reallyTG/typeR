library(jmdem)


### Name: jmdem.control
### Title: Auxiliary for Controlling JMDEM Fitting
### Aliases: jmdem.control

### ** Examples

## Example in jmdem(...). Limit maximum iteration number to 20 and 
## trace the deviance development in the fitting process
MyData <- simdata.jmdem.sim(mformula = y ~ x, dformula = ~ s, 
                            mfamily = poisson(), 
                            dfamily = Gamma(link = "log"), 
                            beta.true = c(0.5, 4), 
                            lambda.true = c(2.5, 3), n = 100)
                            
fit <- jmdem(mformula = y ~ x, dformula = ~ s, data = MyData, 
             mfamily = poisson, dfamily = Gamma(link = "log"), 
             dev.type = "deviance", method = "CG",
             control = list(maxit = 20, fit.trace = TRUE))

## Change to a small convergence tolerance and trace the optimisation 
## process in optim
jmdem.control(list(epsilon = 1e-14, trace = 1))



