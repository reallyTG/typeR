library(probably)


### Name: threshold_perf
### Title: Generate performance metrics across probability thresholds
### Aliases: threshold_perf threshold_perf.data.frame

### ** Examples

library(dplyr)
data("segment_logistic")

# Set the threshold to 0.6
# > 0.6 = good
# < 0.6 = poor
threshold_perf(segment_logistic, Class, .pred_good, thresholds = 0.6)

# Set the threshold to multiple values
thresholds <- seq(0.5, 0.9, by = 0.1)

segment_logistic %>%
  threshold_perf(Class, .pred_good, thresholds)

# ---------------------------------------------------------------------------

# It works with grouped data frames as well
# Let's mock some resampled data
resamples <- 5

mock_resamples <- resamples %>%
  replicate(
    expr = sample_n(segment_logistic, 100, replace = TRUE),
    simplify = FALSE
  ) %>%
  bind_rows(.id = "resample")

resampled_threshold_perf <- mock_resamples %>%
  group_by(resample) %>%
  threshold_perf(Class, .pred_good, thresholds)

resampled_threshold_perf

# Average over the resamples
resampled_threshold_perf %>%
  group_by(.metric, .threshold) %>%
  summarise(.estimate = mean(.estimate))




