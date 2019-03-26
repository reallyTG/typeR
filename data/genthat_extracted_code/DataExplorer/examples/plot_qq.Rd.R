library(DataExplorer)


### Name: plot_qq
### Title: Plot QQ plot
### Aliases: plot_qq
### Keywords: plot_qq

### ** Examples

plot_qq(iris)
plot_qq(iris, by = "Sepal.Width")
plot_qq(iris, by = "Species", nrow = 2L, ncol = 2L)

plot_qq(
  data = airquality,
  geom_qq_args = list(na.rm = TRUE),
  geom_qq_line_args = list(na.rm = TRUE)
)



