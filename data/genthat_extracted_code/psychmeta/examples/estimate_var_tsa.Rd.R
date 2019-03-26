library(psychmeta)


### Name: estimate_var_tsa
### Title: Taylor Series Approximation of effect-size variances corrected
###   for psychometric artifacts
### Aliases: estimate_var_tsa estimate_var_tsa_meas estimate_var_tsa_uvdrr
###   estimate_var_tsa_bvdrr estimate_var_tsa_uvirr estimate_var_tsa_bvirr
###   estimate_var_tsa_rb1 estimate_var_tsa_rb2

### ** Examples

estimate_var_tsa_meas(mean_rtp = .5, var = .02,
                 mean_qx = .8,
                 mean_qy = .8)
estimate_var_tsa_uvdrr(mean_rtpa = .5, var = .02,
                  mean_ux = .8,
                  mean_qxa = .8,
                  mean_qyi = .8)
estimate_var_tsa_bvdrr(mean_rtpa = .5, var = .02,
                  mean_ux = .8,
                  mean_uy = .8,
                  mean_qxa = .8,
                  mean_qya = .8)
estimate_var_tsa_uvirr(mean_rtpa = .5, var = .02,
                  mean_ut = .8,
                  mean_qxa = .8,
                  mean_qyi = .8)
estimate_var_tsa_bvirr(mean_rtpa = .5, var = .02,
                  mean_ux = .8,
                  mean_uy = .8,
                  mean_qxa = .8,
                  mean_qya = .8,
                  sign_rxz = 1, sign_ryz = 1)
estimate_var_tsa_rb1(mean_rtpa = .5, var = .02,
                mean_ux = .8,
                mean_rxx = .8,
                mean_ryy = .8)
estimate_var_tsa_rb2(mean_rtpa = .5, var = .02,
                mean_ux = .8,
                mean_qx = .8,
                mean_qy = .8)



