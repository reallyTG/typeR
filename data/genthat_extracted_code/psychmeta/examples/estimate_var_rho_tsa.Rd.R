library(psychmeta)


### Name: estimate_var_rho_tsa
### Title: Taylor Series Approximation of variance of rho corrected for
###   psychometric artifacts
### Aliases: estimate_var_rho_tsa estimate_var_rho_tsa_meas
###   estimate_var_rho_tsa_uvdrr estimate_var_rho_tsa_bvdrr
###   estimate_var_rho_tsa_uvirr estimate_var_rho_tsa_bvirr
###   estimate_var_rho_tsa_rb1 estimate_var_rho_tsa_rb2

### ** Examples

estimate_var_rho_tsa_meas(mean_rtp = .5, var_rxy = .02, var_e = .01,
                 mean_qx = .8, var_qx = .005,
                 mean_qy = .8, var_qy = .005)
estimate_var_rho_tsa_uvdrr(mean_rtpa = .5, var_rxyi = .02, var_e = .01,
                  mean_ux = .8, var_ux = .005,
                  mean_qxa = .8, var_qxa = .005,
                  mean_qyi = .8, var_qyi = .005)
estimate_var_rho_tsa_bvdrr(mean_rtpa = .5, var_rxyi = .02, var_e = .01,
                  mean_ux = .8, var_ux = .005,
                  mean_uy = .8, var_uy = .005,
                  mean_qxa = .8, var_qxa = .005,
                  mean_qya = .8, var_qya = .005)
estimate_var_rho_tsa_uvirr(mean_rtpa = .5, var_rxyi = .02, var_e = .01,
                  mean_ut = .8, var_ut = .005,
                  mean_qxa = .8, var_qxa = .005,
                  mean_qyi = .8, var_qyi = .005)
estimate_var_rho_tsa_bvirr(mean_rtpa = .5, var_rxyi = .02, var_e = .01,
                  mean_ux = .8, var_ux = .005,
                  mean_uy = .8, var_uy = .005,
                  mean_qxa = .8, var_qxa = .005,
                  mean_qya = .8, var_qya = .005,
                  sign_rxz = 1, sign_ryz = 1)
estimate_var_rho_tsa_rb1(mean_rtpa = .5, var_rxyi = .02, var_e = .01,
                mean_ux = .8, var_ux = .005,
                mean_rxx = .8, var_rxx = .005,
                mean_ryy = .8, var_ryy = .005)
estimate_var_rho_tsa_rb2(mean_rtpa = .5, var_rxyi = .02, var_e = .01,
                mean_ux = .8, var_ux = .005,
                mean_qx = .8, var_qx = .005,
                mean_qy = .8, var_qy = .005)



