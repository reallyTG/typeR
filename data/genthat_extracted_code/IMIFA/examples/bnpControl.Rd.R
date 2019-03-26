library(IMIFA)


### Name: bnpControl
### Title: Control settings for the Bayesian Nonparametric priors for
###   infinite mixture models (or shrinkage priors for overfitted mixtures)
### Aliases: bnpControl
### Keywords: control

### ** Examples

bnpctrl <- bnpControl(learn.d=FALSE, ind.slice=FALSE, alpha.hyper=c(3, 3))

# data(olive)
# sim   <- mcmc_IMIFA(olive, "IMIFA", n.iters=5000, BNP=bnpctrl)

# Alternatively specify these arguments directly
# sim   <- mcmc_IMIFA(olive, "IMIFA", n.iters=5000, learn.d=FALSE,
#                     ind.slice=FALSE, alpha.hyper=c(3, 3))



