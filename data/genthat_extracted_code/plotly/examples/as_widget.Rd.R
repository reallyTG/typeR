library(plotly)


### Name: as_widget
### Title: Convert a list to a plotly htmlwidget object
### Aliases: as_widget

### ** Examples


trace <- list(x = 1, y = 1)
obj <- list(data = list(trace), layout = list(title = "my plot"))
as_widget(obj)




