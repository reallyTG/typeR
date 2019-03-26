library(orsk)


### Name: orsk
### Title: Converting Odds Ratio to Relative Risk in Cohort Studies with
###   Partial Data Information
### Aliases: orsk plot.orsk print.orsk summary.orsk
### Keywords: odds ratio relative risk

### ** Examples

## Not run: 
##D res1 <- orsk(nctr=1636, ntrt=2601, a=2.61, al=2.25, au= 3.03, method="grid")
##D summary(res1)
##D res2 <- orsk(nctr=1636, ntrt=2601, a=2.61, al=2.25, au= 3.03, method="optim")
##D summary(res2)
##D res3 <- orsk(nctr=1636, ntrt=2601, a=2.61, al=2.25, type="lower", method="grid")
##D summary(res3)
##D res4 <- orsk(nctr=1636, ntrt=2601, a=2.61, au=3.03, type="upper", method="grid")
##D summary(res4)
##D res5 <- orsk(nctr=1636, ntrt=2601, a=2.61, al=2.25, au=3.03, type="ci-only", 
##D method="grid")
##D summary(res5)
## End(Not run)



