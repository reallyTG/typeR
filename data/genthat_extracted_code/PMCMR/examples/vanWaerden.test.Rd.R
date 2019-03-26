library(PMCMR)


### Name: vanWaerden.test
### Title: van der Waerden's normal scores test
### Aliases: vanWaerden.test vanWaerden.test.default
###   vanWaerden.test.formula
### Keywords: htest nonparametric

### ** Examples

##
require(stats) 
data(InsectSprays)
attach(InsectSprays)
vanWaerden.test(count, spray)
posthoc.vanWaerden.test(count, spray, "bonferroni")
detach(InsectSprays)
rm(InsectSprays)



