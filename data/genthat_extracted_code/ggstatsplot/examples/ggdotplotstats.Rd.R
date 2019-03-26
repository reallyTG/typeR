library(ggstatsplot)


### Name: ggdotplotstats
### Title: Dot plot/chart for labeled numeric data.
### Aliases: ggdotplotstats ggdotchartstats

### ** Examples

# for reproducibility
set.seed(123)

# plot
ggdotplotstats(
  data = ggplot2::mpg,
  x = cty,
  y = manufacturer,
  conf.level = 0.99,
  test.value = 15,
  test.value.line = TRUE,
  test.line.labeller = TRUE,
  test.value.color = "red",
  centrality.para = "median",
  centrality.k = 0,
  title = "Fuel economy data",
  xlab = "city miles per gallon",
  bf.message = TRUE,
  caption = substitute(
    paste(italic("Source"), ": EPA dataset on http://fueleconomy.gov")
  )
)



