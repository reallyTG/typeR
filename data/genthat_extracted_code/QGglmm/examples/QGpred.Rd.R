library(QGglmm)


### Name: QGpred
### Title: Predict the evolutionary response to selection on the observed
###   scale
### Aliases: QGpred

### ** Examples

## Example with binary traits and a fitness measurement
# Let's assume we dispose of a binary trait measurement 
# and associated fitness of trait 0 (say 1) and trait 1 (say 1.86)
# We further assume a GLMM with Binomial distribution and probit link with:
mu <- -0.1
va <- 2
vp <- 2.5  # note that the latent heritability is very high

# Creating the latent fitness function
# i.e. expected fitness given a latent trait l
# We have a trait 1 with probability pnorm(l) with fitness 1.86
# We have a trait 0 with probability (1 - pnorm(l)) with fitness 1
lat.fit<- function(l){(1 - pnorm(l)) * 1 + pnorm(l) * 1.86}
# Derivate of the fitnes function
d.lat.fit<- function(l){- dnorm(l) * 1 + dnorm(l) * 1.86}

# Predicting the latent evolutionary response
pred <- QGpred(mu = mu, var.p = vp, var.a = va, fit.func = lat.fit, d.fit.func = d.lat.fit)

# Predicting the observed evolutionary response
# Current observed phenotypic mean
QGmean(mu = mu, var = vp, link.inv = QGlink.funcs("binom1.probit")$inv.link)
# Predicted observed phenotypic mean after selection
QGmean(mu = mu + pred$lat.resp, var = vp, link.inv = QGlink.funcs("binom1.probit")$inv.link)



