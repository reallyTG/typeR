library(BayesGOF)


### Name: gMLE.bb
### Title: Beta-Binomial Parameter Estimation
### Aliases: gMLE.bb mom.est

### ** Examples

data(rat)
### MLE estimate of alpha and beta
rat.mle <- gMLE.bb(rat$y, rat$N)$estimate
rat.mle
### MoM estimate of alpha and beta
rat.mom <- gMLE.bb(rat$y, rat$N)$initial
rat.mom



