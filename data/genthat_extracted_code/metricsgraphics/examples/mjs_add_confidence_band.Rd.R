library(metricsgraphics)


### Name: mjs_add_confidence_band
### Title: Add a confidence band to line plot
### Aliases: mjs_add_confidence_band

### ** Examples

require(binom)
require(dplyr)

set.seed(1492)
binom.confint(x=sample(2:30, 100, replace=TRUE), n = 100, tol = 1e-8,
              methods="bayes") %>%
  mutate(x=1:100) -> bdat

bdat %>%
  mjs_plot(x=x, y=mean, width=600, height=240) %>%
  mjs_axis_x(show_secondary_x_label=FALSE,
             extended_ticks=TRUE) %>%
  mjs_line() %>%
  mjs_add_confidence_band(lower_accessor="lower",
                          upper_accessor="upper")



