library(psychmeta)


### Name: estimate_artifacts
### Title: Estimation of applicant and incumbent reliabilities and of true-
###   and observed-score u ratios
### Aliases: estimate_artifacts estimate_rxxa estimate_rxxi estimate_ut
###   estimate_ux estimate_ryya estimate_ryyi estimate_uy estimate_up
###   estimate_rxxa_u estimate_rxxi_u

### ** Examples

estimate_rxxa(rxxi = .8, ux = .8, ux_observed = TRUE)
estimate_rxxi(rxxa = .8, ux = .8, ux_observed = TRUE)
estimate_ut(ux = .8, rxx = .8, rxx_restricted = TRUE)
estimate_ux(ut = .8, rxx = .8, rxx_restricted = TRUE)
estimate_ryya(ryyi = .8, rxyi = .3, ux = .8)
estimate_ryyi(ryya = .8, rxyi = .3, ux = .8)
estimate_uy(ryyi = c(.5, .7), ryya = c(.7, .8))
estimate_up(ryyi = c(.5, .7), ryya = c(.7, .8))
estimate_rxxa_u(ux = c(.7, .8), ut = c(.65, .75))
estimate_rxxi_u(ux = c(.7, .8), ut = c(.65, .75))



