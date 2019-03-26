library(sensR)


### Name: clls-deprecated
### Title: Cumulative Link Location-Scale Models
### Aliases: clls-deprecated clls
### Keywords: models

### ** Examples

## Not run: 
##D   options(contrasts = c("contr.treatment", "contr.poly"))
##D   ## Extend example from polr in package MASS:
##D   ## Fit model from polr example:
##D   data(housing, package = "MASS")
##D   fm1 <- clls(Sat ~ Infl + Type + Cont, weights = Freq, data = housing)
##D   fm1
##D   summary(fm1)
##D   ## With probit link:
##D   summary(update(fm1, method = "probit"))
##D 
##D   ## Allow scale to depend on Cont-variable
##D   summary(fm2 <- update(fm1, scale =~ Cont))
##D   anova(fm1, fm2)
##D   ## which seems to improve the fit
## End(Not run)




