library(spaMM)


### Name: confint.HLfit
### Title: Confidence intervals for fixed-effect parameters
### Aliases: confint.HLfit confint

### ** Examples

## Not run: 
##D  data("wafers")
##D  wfit <- HLfit(y ~X1+(1|batch),family=Gamma(log),data=wafers,HLmethod="ML")
##D  confint(wfit,"X1")
## End(Not run)



