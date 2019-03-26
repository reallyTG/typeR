library(IMIFA)


### Name: mixfaControl
### Title: Control settings for the IMIFA family of factor analytic
###   mixtures
### Aliases: mixfaControl
### Keywords: control

### ** Examples

mfctrl <- mixfaControl(n.iters=200, prec.mu=1E-03, sigma.mu=NULL,
                       beta0=1, uni.type="constrained")

# data(olive)
# sim  <- mcmc_IMIFA(olive, "IMIFA", mixFA=mfctrl)

# Alternatively specify these arguments directly
# sim  <- mcmc_IMIFA(olive, "IMIFA", n.iters=200, prec.mu=1E-03,
#                    sigma.mu=NULL, beta0=1, uni.type="constrained")



