library(tracerer)


### Name: calc_summary_stats_traces
### Title: Calculates the Effective Sample Sizes of the traces of multiple
###   estimated variables.
### Aliases: calc_summary_stats_traces

### ** Examples

  estimates_all <- parse_beast_log(get_tracerer_path("beast2_example_output.log"))
  estimates <- remove_burn_ins(estimates_all, burn_in_fraction = 0.1)

  sum_stats <- calc_summary_stats_traces(
    estimates,
    sample_interval = 1000
  )

  testit::assert("mean" %in% colnames(sum_stats))



