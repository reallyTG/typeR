library(Rchoice)


### Name: effect.Rchoice
### Title: Get the conditional individual coefficients
### Aliases: effect.Rchoice

### ** Examples

## Not run: 
##D ## Probit Model with Random Effects and Random Parameters
##D data('Unions', package = 'pglm')
##D Unions$lwage <- log(Unions$wage)
##D union.ran <- Rchoice(union ~ age + exper + rural + lwage,
##D                      data = Unions[1:2000, ],
##D                      family = binomial('probit'),
##D                      ranp = c(constant = "n", lwage = "t"),
##D                      R = 10,
##D                      panel = TRUE,
##D                      index = "id",
##D                      print.init = TRUE)
##D 
##D ## Get the individuals' conditional mean and their standard errors for lwage                      
##D bi.wage <- effect.Rchoice(union.ran, par = "lwage", effect = "ce")
##D summary(bi.wage$mean)
##D summary(bi.wage$sd.est)
## End(Not run)



