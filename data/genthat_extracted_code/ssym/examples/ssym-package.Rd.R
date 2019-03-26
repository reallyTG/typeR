library(ssym)


### Name: ssym-package
### Title: Fitting Semiparametric Log-symmetric Regression Models
### Aliases: ssym-package ssym

### ** Examples

data("Snacks", package="ssym")                                    
fit <- ssym.l(log(texture) ~ type + ncs(week) | type, data=Snacks,
               family='Student', xi=15)     
summary(fit)                                                      



