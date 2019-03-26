library(yardstick)


### Name: lift_curve
### Title: Lift curve
### Aliases: lift_curve lift_curve.data.frame autoplot.lift_df

### ** Examples

library(ggplot2)
library(dplyr)

# Two class - a tibble is returned
lift_curve(two_class_example, truth, Class1)

# Use autoplot to visualize
autoplot(lift_curve(two_class_example, truth, Class1))

# Multiclass one-vs-all approach
# One curve per level
hpc_cv %>%
  filter(Resample == "Fold01") %>%
  lift_curve(obs, VF:L) %>%
  autoplot()

# Same as above, but will all of the resamples
hpc_cv %>%
  group_by(Resample) %>%
  lift_curve(obs, VF:L) %>%
  autoplot()




