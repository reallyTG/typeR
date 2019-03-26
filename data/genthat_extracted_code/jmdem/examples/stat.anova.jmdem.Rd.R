library(jmdem)


### Name: stat.anova.jmdem
### Title: JMDEM Anova Statistics
### Aliases: stat.anova.jmdem

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
              
stat.anova.jmdem(anova(fit, test = "Rao", print.results = FALSE)$table.x)



