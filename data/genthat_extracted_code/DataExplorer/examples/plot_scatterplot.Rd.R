library(DataExplorer)


### Name: plot_scatterplot
### Title: Create scatterplot for all features
### Aliases: plot_scatterplot
### Keywords: plot_scatterplot

### ** Examples

plot_scatterplot(iris, by = "Species")

library(ggplot2)
plot_scatterplot(
  data = mpg,
  by = "hwy",
  geom_point_args = list(size = 1L),
  theme_config = list("axis.text.x" = element_text(angle = 90)),
  ncol = 4L
)



