library(GSM)


### Name: estim.gsm_theta
### Title: Estimation of a Gamma Shape Mixture Model (GSM)
### Aliases: estim.gsm_theta
### Keywords: distribution mixture

### ** Examples

## Not run: 
##D set.seed(2040)
##D y <- rgsm(500, c(.1, .3, .4, .2), 1)
##D burnin <- 100
##D mcmcsim <- 500
##D J <- 250
##D gsm.out <- estim.gsm_theta(y, J, 300, burnin + mcmcsim, 6500, 340, 1/J)
##D summary(gsm.out, plot = TRUE, start = (burnin + 1))
##D plot(gsm.out, ndens = 0, nbin = 20, histogram = TRUE, start = (burnin + 1))
## End(Not run)



