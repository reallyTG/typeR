library(ggstatsplot)


### Name: grouped_gghistostats
### Title: Grouped histograms for distribution of a numeric variable
### Aliases: grouped_gghistostats

### ** Examples


ggstatsplot::grouped_gghistostats(
  data = iris,
  x = Sepal.Length,
  test.value = 5,
  bf.message = TRUE,
  grouping.var = Species,
  bar.fill = "orange",
  nrow = 1,
  ggplot.component = list(
    ggplot2::scale_x_continuous(breaks = seq(3, 9, 1), limits = (c(3, 9))),
    ggplot2::scale_y_continuous(breaks = seq(0, 25, 5), limits = (c(0, 25)))
  ),
  messages = FALSE
)



