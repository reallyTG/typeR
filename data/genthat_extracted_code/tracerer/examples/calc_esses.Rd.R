library(tracerer)


### Name: calc_esses
### Title: Calculates the Effective Sample Sizes from a parsed BEAST2 log
###   file
### Aliases: calc_esses

### ** Examples

  # Parse an example log file
  estimates_all <- parse_beast_log(
    get_tracerer_path("beast2_example_output.log")
  )

  # Remove burn-ins
  estimates <- remove_burn_ins(estimates_all,
    burn_in_fraction = 0.1
  )

  # Calculate the effective sample sizes of all parameter estimates
  esses <- calc_esses(
    estimates,
    sample_interval = 1000
  )

  expected <- c(10, 10, 10, 10, 7, 10, 9, 6)
  testit::assert(all(esses == expected))



