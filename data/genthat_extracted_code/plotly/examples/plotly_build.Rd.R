library(plotly)


### Name: plotly_build
### Title: 'Build' (i.e., evaluate) a plotly object
### Aliases: plotly_build

### ** Examples


p <- plot_ly(economics, x = ~date, y = ~pce)
# the unevaluated plotly object
str(p)
# the evaluated data
str(plotly_build(p)$x$data)




