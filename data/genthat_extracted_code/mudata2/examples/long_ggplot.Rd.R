library(mudata2)


### Name: long_ggplot
### Title: Smart plotting of parameter-long data frames
### Aliases: long_ggplot long_plot long_plot_base

### ** Examples

library(tidyr)
library(dplyr)
pocmaj_long <- pocmajsum %>%
  select(core, depth, Ca, Ti, V) %>%
  gather(Ca, Ti, V, key = "variable", value = "value")
long_plot(pocmaj_long, col="core")
long_ggplot(pocmaj_long, col="core")




