library(GSM)


### Name: summary-methods
### Title: Summarizing Gamma Shape Mixtures
### Aliases: summary-methods summary,ANY-method summary,gsm-method
### Keywords: methods

### ** Examples

set.seed(2040)
y <- rgsm(500, c(.1, .3, .4, .2), 1)
burnin <- 5
mcmcsim <- 10
J <- 250
gsm.out <- estim.gsm(y, J, 300, burnin + mcmcsim, 6500, 340, 1/J)
summary(gsm.out, TRUE, start = (burnin + 1))



