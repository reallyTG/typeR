library(quantmod)


### Name: fittedModel
### Title: quantmod Fitted Objects
### Aliases: fittedModel fittedModel<- formula.quantmod plot.quantmod
###   coefficients.quantmod coef.quantmod residuals.quantmod resid.quantmod
###   fitted.values.quantmod fitted.quantmod anova.quantmod logLik.quantmod
###   vcov.quantmod
### Keywords: models

### ** Examples

## Not run: 
##D x <- specifyModel(Next(OpCl(DIA)) ~ OpCl(VIX))
##D x.lm <- buildModel(x,method='lm',training.per=c('2001-01-01','2001-04-01'))
##D 
##D fittedModel(x.lm)
##D 
##D coef(fittedModel(x.lm))
##D coef(x.lm)                  # same
##D 
##D vcov(fittedModel(x.lm))
##D vcov(x.lm)                  # same
## End(Not run)



