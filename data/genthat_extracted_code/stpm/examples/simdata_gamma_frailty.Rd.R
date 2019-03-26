library(stpm)


### Name: simdata_gamma_frailty
### Title: This script simulates data using familial frailty model.  We use
###   the following variation: gamma(mu, ssq), where mu is the mean and ssq
###   is sigma square. See:
###   https://www.rocscience.com/help/swedge/webhelp/swedge/Gamma_Distribution.htm
### Aliases: simdata_gamma_frailty

### ** Examples

library(stpm)
dat <- simdata_gamma_frailty(N=10)
head(dat)




