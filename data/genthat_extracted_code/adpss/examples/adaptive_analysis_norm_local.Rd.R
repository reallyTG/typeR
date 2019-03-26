library(adpss)


### Name: adaptive_analysis_norm_local
### Title: Analyze data according to a locally efficient adaptive design.
### Aliases: adaptive_analysis_norm_local

### ** Examples

# Sample size calculation
sample_size_norm_local(
  overall_sig_level = 0.025,
  min_effect_size = -log(0.65),
  effect_size = 11.11 / 20.02, # needs not be MLE
  time = 20.02,
  target_power = 0.75,
  sample_size = TRUE
  )



