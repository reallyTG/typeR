library(WRS2)


### Name: twocor
### Title: Confidence intervals for two-sided tests on correlation
###   coefficients.
### Aliases: twocor twopcor print.twocor
### Keywords: models

### ** Examples

ct1 <- subset(hangover, subset = (group == "control" & time == 1))$symptoms
ct2 <- subset(hangover, subset = (group == "control" & time == 2))$symptoms
at1 <- subset(hangover, subset = (group == "alcoholic" & time == 1))$symptoms
at2 <- subset(hangover, subset = (group == "alcoholic" & time == 2))$symptoms

set.seed(111)
twopcor(ct1, ct2, at1, at2)
set.seed(123)
twocor(ct1, ct2, at1, at2, corfun = "pbcor", beta = 0.15)
set.seed(224)
twocor(ct1, ct2, at1, at2, corfun = "wincor", tr = 0.15, nboot = 50)



