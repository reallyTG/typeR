library(tracerer)


### Name: calc_hpd_interval
### Title: Calculate the Highest Probability Density of an MCMC trace that
###   has its burn-in removed
### Aliases: calc_hpd_interval

### ** Examples

  estimates <- parse_beast_log(get_tracerer_path("beast2_example_output.log"))
  tree_height_trace <- remove_burn_in(
    estimates$TreeHeight,
    burn_in_fraction = 0.1
  )

  hpd_interval <- calc_hpd_interval(tree_height_trace, proportion = 0.95)
  testthat::expect_equivalent(0.453, hpd_interval[1], tolerance = 0.01)
  testthat::expect_equivalent(1.816, hpd_interval[2], tolerance = 0.01)



