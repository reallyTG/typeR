library(survivalAnalysis)


### Name: forest_plot
### Title: Forest plots for survival analysis.
### Aliases: forest_plot forest_plot.df

### ** Examples

library(magrittr)
library(dplyr)
survival::colon %>%
   analyse_multivariate(vars(time, status),
                        vars(rx, sex, age, obstruct, perfor, nodes, differ, extent)) %>%
   forest_plot()



