library(yardstick)


### Name: gain_curve
### Title: Gain curve
### Aliases: gain_curve gain_curve.data.frame autoplot.gain_df

### ** Examples

library(ggplot2)
library(dplyr)

# Two class - a tibble is returned
gain_curve(two_class_example, truth, Class1)

# Use autoplot to visualize
# The top left hand corner of the grey triangle is a "perfect" gain curve
autoplot(gain_curve(two_class_example, truth, Class1))

# Multiclass one-vs-all approach
# One curve per level
hpc_cv %>%
  filter(Resample == "Fold01") %>%
  gain_curve(obs, VF:L) %>%
  autoplot()

# Same as above, but will all of the resamples
# The resample with the minimum (farthest to the left) "perfect" value is
# used to draw the shaded region
hpc_cv %>%
  group_by(Resample) %>%
  gain_curve(obs, VF:L) %>%
  autoplot()




