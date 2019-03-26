library(adpss)


### Name: adaptive_analysis_norm_global
### Title: Analyze data according to a globally efficient adaptive design.
### Aliases: adaptive_analysis_norm_global

### ** Examples

# Construct an initial working test
# Note: cost_type_1_err will be automatically calculated when 0 is specified.
init_work_test <- work_test_norm_global(min_effect_size = -log(0.65), cost_type_1_err=1683.458)

# Sample size calculation
sample_size_norm_global(
  initial_test = init_work_test,
  effect_size = 11.11 / 20.02, # needs not be MLE
  time = 20.02,
  target_power = 0.75,
  sample_size = TRUE
  )



