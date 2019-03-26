library(Rchoice)


### Name: plot.Rchoice
### Title: Plot of the distribution of conditional expectation of random
###   parameters.
### Aliases: plot.Rchoice

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
##D ## Plot the distribution of the conditional mean for lwage
##D plot(union.ran, par = "lwage", type = "density")
##D 
##D ## Plot the conditional mean for the first 20 individuals
##D plot(union.ran, par = "lwage", ind =  TRUE, id = 1:20, col = "blue")
##D 
##D ## Plot the compensating variation
##D plot(union.ran, par = "lwage", effect = "cv", wrt = "rural", type = "histogram")
## End(Not run)



