library(psychmeta)


### Name: compute_dmod_par
### Title: Function for computing parametric d_Mod effect sizes for any
###   number of focal groups
### Aliases: compute_dmod_par

### ** Examples

compute_dmod_par(referent_int = -.05, referent_slope = .5,
                 focal_int = c(.05, 0, -.05), focal_slope = c(.5, .3, .3),
                 focal_mean_x = c(-.5, 0, -.5), focal_sd_x = rep(1, 3),
                 referent_sd_y = 1,
                 focal_min_x = rep(-Inf, 3), focal_max_x = rep(Inf, 3),
                 focal_names = NULL, rescale_cdf = TRUE)



