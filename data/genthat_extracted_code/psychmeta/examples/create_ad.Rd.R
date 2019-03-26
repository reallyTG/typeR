library(psychmeta)


### Name: create_ad
### Title: Generate an artifact distribution object for use in
###   artifact-distribution meta-analysis programs.
### Aliases: create_ad

### ** Examples

## Example computed using observed values only:
create_ad(ad_type = "tsa", rxxa = c(.9, .8), n_rxxa = c(50, 150),
              rxxi = c(.8, .7), n_rxxi = c(50, 150),
              ux = c(.9, .8), ni_ux = c(50, 150))

create_ad(ad_type = "int", rxxa = c(.9, .8), n_rxxa = c(50, 150),
              rxxi = c(.8, .7), n_rxxi = c(50, 150),
              ux = c(.9, .8), ni_ux = c(50, 150))

## Example computed using all possible input arguments (arbitrary values):
rxxa <- rxxi <- ux <- ut <- c(.7, .8)
n_rxxa <- n_rxxi <- ni_ux <- ni_ut <- c(50, 100)
na_ux <- na_ut <- c(200, 200)
mean_qxa <- mean_qxi <- mean_ux <- mean_ut <- mean_rxxi <- mean_rxxa <- c(.7, .8)
var_qxa <- var_qxi <- var_ux <- var_ut <- var_rxxi <- var_rxxa <- c(.1, .05)
k_qxa <- k_qxi <- k_ux <- k_ut <- k_rxxa <- k_rxxi <- 2
mean_n_qxa <- mean_n_qxi <- mean_ni_ux <- mean_ni_ut <- mean_n_rxxa <- mean_n_rxxi <- c(100, 100)
dep_sds_ux_obs <- dep_sds_ux_spec <- dep_sds_ut_obs <- dep_sds_ut_spec <- FALSE
mean_na_ux <- mean_na_ut <- c(200, 200)

wt_rxxa <- n_rxxa
wt_rxxi <- n_rxxi
wt_ux <- ni_ux
wt_ut <- ni_ut

estimate_rxxa <- TRUE
estimate_rxxi <- TRUE
estimate_ux <- TRUE
estimate_ut <- TRUE
var_unbiased <- TRUE

create_ad(rxxa = rxxa, n_rxxa = n_rxxa, wt_rxxa = wt_rxxa,
              mean_qxa = mean_qxa, var_qxa = var_qxa,
              k_qxa = k_qxa, mean_n_qxa = mean_n_qxa,
              mean_rxxa = mean_rxxa, var_rxxa = var_rxxa,
              k_rxxa = k_rxxa, mean_n_rxxa = mean_n_rxxa,

              rxxi = rxxi, n_rxxi = n_rxxi, wt_rxxi = wt_rxxi,
              mean_qxi = mean_qxi, var_qxi = var_qxi,
              k_qxi = k_qxi, mean_n_qxi = mean_n_qxi,
              mean_rxxi = mean_rxxi, var_rxxi = var_rxxi,
              k_rxxi = k_rxxi, mean_n_rxxi = mean_n_rxxi,

              ux = ux, ni_ux = ni_ux, na_ux = na_ux, wt_ux = wt_ux,
              dep_sds_ux_obs = dep_sds_ux_obs,
              mean_ux = mean_ux, var_ux = var_ux, k_ux =
               k_ux, mean_ni_ux = mean_ni_ux,
              mean_na_ux = mean_na_ux, dep_sds_ux_spec = dep_sds_ux_spec,

              ut = ut, ni_ut = ni_ut, na_ut = na_ut, wt_ut = wt_ut,
              dep_sds_ut_obs = dep_sds_ut_obs,
              mean_ut = mean_ut, var_ut = var_ut,
              k_ut = k_ut, mean_ni_ut = mean_ni_ut,
              mean_na_ut = mean_na_ut, dep_sds_ut_spec = dep_sds_ut_spec,

              estimate_rxxa = estimate_rxxa, estimate_rxxi = estimate_rxxi,
              estimate_ux = estimate_ux, estimate_ut = estimate_ut, var_unbiased = var_unbiased)



