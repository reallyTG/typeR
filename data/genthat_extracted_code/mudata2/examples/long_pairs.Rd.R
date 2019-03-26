library(mudata2)


### Name: long_pairs
### Title: Biplot a parameter-long data frame
### Aliases: long_pairs long_biplot autobiplot autobiplot.data.frame

### ** Examples

library(tidyr)
library(dplyr)

# create a long, summarised representation of pocmaj data
pocmaj_long <- pocmajsum %>%
  select(core, depth, Ca, Ti, V) %>%
  gather(Ca, Ti, V, key = "param", value = "value")

# biplot using base plotting
long_biplot(pocmaj_long, id_vars = c("core", "depth"), name_var = "param")

# biplot using ggplot
autobiplot(pocmaj_long, id_vars = c("core", "depth"), name_var = "param")

# get the raw data used
long_pairs(pocmaj_long, id_vars = c("core", "depth"), name_var = "param")




