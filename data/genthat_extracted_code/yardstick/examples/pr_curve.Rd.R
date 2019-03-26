library(yardstick)


### Name: pr_curve
### Title: Precision recall curve
### Aliases: pr_curve pr_curve.data.frame autoplot.pr_df

### ** Examples

library(ggplot2)
library(dplyr)

# Two class - a tibble is returned
pr_curve(two_class_example, truth, Class1)

# Visualize the curve using ggplot2 manually
pr_curve(two_class_example, truth, Class1) %>%
  ggplot(aes(x = recall, y = precision)) +
  geom_path() +
  coord_equal() +
  theme_bw()

# Or use autoplot
autoplot(pr_curve(two_class_example, truth, Class1))

# Multiclass one-vs-all approach
# One curve per level
hpc_cv %>%
  filter(Resample == "Fold01") %>%
  pr_curve(obs, VF:L) %>%
  autoplot()

# Same as above, but will all of the resamples
hpc_cv %>%
  group_by(Resample) %>%
  pr_curve(obs, VF:L) %>%
  autoplot()




