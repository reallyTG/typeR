library(sjPlot)


### Name: plot_likert
### Title: Plot likert scales as centered stacked bars
### Aliases: plot_likert

### ** Examples

library(sjmisc)
data(efc)
# find all variables from COPE-Index, which all have a "cop" in their
# variable name, and then plot that subset as likert-plot
find_var(efc, pattern = "cop", out = "df") %>% plot_likert()

plot_likert(
  find_var(efc, pattern = "cop", out = "df"),
  grid.range = 1.2,
  expand.grid = FALSE,
  values = "sum.outside",
  show.prc.sign = TRUE
)




