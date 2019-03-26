library(tracerer)


### Name: calc_summary_stats_trace
### Title: Calculates the Effective Sample Sizes of one estimated
###   variable's trace.
### Aliases: calc_summary_stats_trace

### ** Examples

  estimates_all <- parse_beast_log(get_tracerer_path("beast2_example_output.log"))
  estimates <- remove_burn_ins(estimates_all, burn_in_fraction = 0.1)

  sum_stats <- calc_summary_stats_trace(
    estimates$posterior,
    sample_interval = 1000
  )

  testit::assert("mean" %in% names(sum_stats))



