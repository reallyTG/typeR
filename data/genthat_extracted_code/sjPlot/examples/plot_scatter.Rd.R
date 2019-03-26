library(sjPlot)


### Name: plot_scatter
### Title: Plot (grouped) scatter plots
### Aliases: plot_scatter

### ** Examples

# load sample date
library(sjmisc)
library(sjlabelled)
data(efc)

# simple scatter plot
plot_scatter(efc, e16sex, neg_c_7)

# simple scatter plot, increased jittering
plot_scatter(efc, e16sex, neg_c_7, jitter = .4)

# grouped scatter plot
plot_scatter(efc, c160age, e17age, e42dep)

# grouped scatter plot with marginal rug plot
# and add fitted line for complete data
plot_scatter(
  efc, c12hour, c160age, c172code,
  show.rug = TRUE, fit.line = "lm"
)

# grouped scatter plot with marginal rug plot
# and add fitted line for each group
plot_scatter(
  efc, c12hour, c160age, c172code,
  show.rug = TRUE, fit.grps = "loess",
  grid = TRUE
)




