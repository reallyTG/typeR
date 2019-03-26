library(mschart)


### Name: chart_data_fill
### Title: Modify fill colour
### Aliases: chart_data_fill

### ** Examples

my_scatter <- ms_scatterchart(data = iris, x = "Sepal.Length",
  y = "Sepal.Width",  group = "Species")
my_scatter <- chart_data_fill(my_scatter,
  values = c(virginica = "#6FA2FF", versicolor = "#FF6161", setosa = "#81FF5B") )



