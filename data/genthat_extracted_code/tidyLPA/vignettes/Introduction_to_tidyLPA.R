## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval = F-----------------------------------------------------------
#  install.packages("tidyLPA")

## ----gh-installation, eval = FALSE---------------------------------------
#  install.packages("devtools")
#  devtools::install_github("jrosen48/tidyLPA")

## ------------------------------------------------------------------------
library(tidyLPA)
d <- pisaUSA15[1:100, ]

## ---- warning = F, message = F-------------------------------------------
compare_solutions(d, broad_interest, enjoyment, self_efficacy)

## ------------------------------------------------------------------------
m3 <- estimate_profiles(d, 
                        broad_interest, enjoyment, self_efficacy,
                        n_profiles = 4)

## ------------------------------------------------------------------------
plot_profiles(m3)

## ------------------------------------------------------------------------
plot_profiles(m3, to_center = TRUE, to_scale = TRUE)

## ------------------------------------------------------------------------
library(dplyr, warn.conflicts = FALSE)

estimate_profiles(d, 
                  broad_interest, enjoyment, self_efficacy, 
                  n_profiles = 3) %>% 
    plot_profiles(to_center = TRUE)

## ------------------------------------------------------------------------
m3 <- estimate_profiles(d, 
                        broad_interest, enjoyment, self_efficacy, 
                        n_profiles = 3, to_return = "mclust")

plot_profiles(m3, plot_what = "mclust")

## ------------------------------------------------------------------------
estimate_profiles(d, 
                  broad_interest, enjoyment, self_efficacy, 
                  variances = "varying",
                  covariances = "varying",
                  n_profiles = 3)

## ------------------------------------------------------------------------
estimate_profiles(d,
                  broad_interest, enjoyment, self_efficacy,
                  n_profiles = 4)

## ------------------------------------------------------------------------
attributes(m3)$mclust_output$parameters

## ------------------------------------------------------------------------
m3_mclust <- estimate_profiles(d, 
                               broad_interest, enjoyment, self_efficacy, 
                               n_profiles = 4, 
                               to_return = "mclust")

## ------------------------------------------------------------------------
m3_mclust$parameters

## ------------------------------------------------------------------------
m3_processed_raw <- estimate_profiles(d, 
                                      broad_interest, enjoyment, self_efficacy, 
                                      n_profiles = 4, 
                                      center_raw_data = TRUE, 
                                      scale_raw_data = TRUE)

## ------------------------------------------------------------------------
estimate_profiles(d, 
                  broad_interest, enjoyment,
                  n_profiles = 4, 
                  return_orig_df = TRUE)

## ---- eval = F-----------------------------------------------------------
#  compare_solutions_mplus(d, broad_interest, enjoyment, self_efficacy)

## ---- eval = F-----------------------------------------------------------
#  compare_solutions_mplus(d, broad_interest, enjoyment, self_efficacy,
#                          return_stats_df = TRUE)

## ------------------------------------------------------------------------
if (require('parallel')) {
  parallel::detectCores()
}

## ---- eval = F-----------------------------------------------------------
#  compare_solutions_mplus(d, broad_interest, enjoyment, self_efficacy, n_processors = 4)

## ---- eval = F-----------------------------------------------------------
#  m1 <- estimate_profiles_mplus(d,
#                                broad_interest, enjoyment, self_efficacy,
#                                n_profiles = 3)

## ---- eval = F-----------------------------------------------------------
#  plot_profiles_mplus(m1, to_center = TRUE, to_scale = TRUE)

## ---- eval = F-----------------------------------------------------------
#  bootstrap_lrt(d, broad_interest, enjoyment, self_efficacy)

## ---- eval = F-----------------------------------------------------------
#  estimate_profiles(d,
#                    broad_interest, enjoyment, self_efficacy,
#                    n_profiles = 4,
#                    prior_control = TRUE)

