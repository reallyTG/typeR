library(PMCMR)


### Name: posthoc.vanWaerden.test
### Title: Pairwise Test for Multiple Comparisons of normal scores (van der
###   Waerden test)
### Aliases: posthoc.vanWaerden.test posthoc.vanWaerden.test.default
###   posthoc.vanWaerden.test.formula
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



