library(psychmeta)


### Name: estimate_var_artifacts
### Title: Taylor series approximations for the variances of estimates
###   artifact distributions.
### Aliases: estimate_var_artifacts estimate_var_qxi estimate_var_qxa
###   estimate_var_rxxi estimate_var_rxxa estimate_var_ut estimate_var_ux
###   estimate_var_ryya estimate_var_qya estimate_var_qyi estimate_var_ryyi

### ** Examples

estimate_var_qxi(qxa = c(.8, .85, .9, .95), var_qxa = c(.02, .03, .04, .05),
                 ux = .8, var_ux = 0,
                 ux_observed = c(TRUE, TRUE, FALSE, FALSE),
                 indirect_rr = c(TRUE, FALSE, TRUE, FALSE))
estimate_var_qxa(qxi = c(.8, .85, .9, .95), var_qxi = c(.02, .03, .04, .05),
                 ux = .8, var_ux = 0,
                 ux_observed = c(TRUE, TRUE, FALSE, FALSE),
                 indirect_rr = c(TRUE, FALSE, TRUE, FALSE))
estimate_var_rxxi(rxxa = c(.8, .85, .9, .95),
                  var_rxxa = c(.02, .03, .04, .05), ux = .8, var_ux = 0,
                 ux_observed = c(TRUE, TRUE, FALSE, FALSE),
                 indirect_rr = c(TRUE, FALSE, TRUE, FALSE))
estimate_var_rxxa(rxxi = c(.8, .85, .9, .95), var_rxxi = c(.02, .03, .04, .05),
                  ux = .8, var_ux = 0,
                 ux_observed = c(TRUE, TRUE, FALSE, FALSE),
                 indirect_rr = c(TRUE, FALSE, TRUE, FALSE))
estimate_var_ut(rxx = c(.8, .85, .9, .95), var_rxx = 0,
                ux = c(.8, .8, .9, .9), var_ux = c(.02, .03, .04, .05),
                 rxx_restricted = c(TRUE, TRUE, FALSE, FALSE),
                rxx_as_qx = c(TRUE, FALSE, TRUE, FALSE))
estimate_var_ux(rxx = c(.8, .85, .9, .95), var_rxx = 0,
                ut = c(.8, .8, .9, .9), var_ut = c(.02, .03, .04, .05),
                 rxx_restricted = c(TRUE, TRUE, FALSE, FALSE),
                rxx_as_qx = c(TRUE, FALSE, TRUE, FALSE))
estimate_var_ryya(ryyi = .9, var_ryyi = .04, rxyi = .4, var_rxyi = 0, ux = .8, var_ux = 0)
estimate_var_ryya(ryyi = .9, var_ryyi = .04, rxyi = .4, var_rxyi = 0, ux = .8, var_ux = 0)
estimate_var_qyi(qya = .9, var_qya = .04, rxyi = .4, var_rxyi = 0, ux = .8, var_ux = 0)
estimate_var_ryyi(ryya = .9, var_ryya = .04, rxyi = .4, var_rxyi = 0, ux = .8, var_ux = 0)



