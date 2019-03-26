library(IMIFA)


### Name: mgpControl
### Title: Control settings for the MGP prior and AGS for infinite factor
###   models
### Aliases: mgpControl
### Keywords: control

### ** Examples

mgpctrl <- mgpControl(phi.hyper=c(2.5, 1), eps=1e-02)

# data(olive)
# sim   <- mcmc_IMIFA(olive, "IMIFA", n.iters=5000, MGP=mgpctrl)

# Alternatively specify these arguments directly
# sim   <- mcmc_IMIFA(olive, "IMIFA", n.iters=5000, phi.hyper=c(2.5, 1), eps=1e-02)



