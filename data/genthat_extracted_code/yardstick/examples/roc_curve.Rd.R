library(yardstick)


### Name: roc_curve
### Title: Receiver operator curve
### Aliases: roc_curve roc_curve.data.frame autoplot.roc_df

### ** Examples

library(ggplot2)
library(dplyr)

# Two class - a tibbble is returned
roc_curve(two_class_example, truth, Class1)

# Visualize the curve using ggplot2 manually
roc_curve(two_class_example, truth, Class1) %>%
  ggplot(aes(x = 1 - specificity, y = sensitivity)) +
  geom_path() +
  geom_abline(lty = 3) +
  coord_equal() +
  theme_bw()

# Or use autoplot
autoplot(roc_curve(two_class_example, truth, Class1))

## Not run: 
##D 
##D # Multiclass one-vs-all approach
##D # One curve per level
##D hpc_cv %>%
##D   filter(Resample == "Fold01") %>%
##D   roc_curve(obs, VF:L) %>%
##D   autoplot()
##D 
##D # Same as above, but will all of the resamples
##D hpc_cv %>%
##D   group_by(Resample) %>%
##D   roc_curve(obs, VF:L) %>%
##D   autoplot()
## End(Not run)




