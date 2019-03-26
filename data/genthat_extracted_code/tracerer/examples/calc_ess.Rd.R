library(tracerer)


### Name: calc_ess
### Title: Calculates the Effective Sample Size
### Aliases: calc_ess

### ** Examples

  filename <- get_tracerer_path("beast2_example_output.log")

 # Parse the file as-is and conclude the sampling interval
 df <- parse_beast_log(filename)
 sample_interval <- df$Sample[2] - df$Sample[1] # nolint BEAST2 style

 # Only keep the parameter estimates,
 # do not care about the sampling times anymore
 estimates <- subset(df, select = -Sample) # nolint BEAST2 style

 esses <- rep(NA, ncol(estimates))
 burn_in_fraction <- 0.1
 for (i in seq_along(estimates)) {
   # Trace with the burn-in still present
   trace_raw <- as.numeric(t(estimates[i]))

   # Trace with the burn-in removed
   trace <- remove_burn_in(
     trace = trace_raw,
     burn_in_fraction = 0.1
   )

   # Store the effectice sample size
   esses[i] <- calc_ess(trace, sample_interval = sample_interval)
 }

 # Use the values that TRACER shows
 expected_esses <- c(10, 10, 10, 10, 7, 10, 9, 6)
 testit::assert(all(expected_esses - esses < 0.5))



