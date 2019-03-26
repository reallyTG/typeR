library(plotly)


### Name: style
### Title: Modify trace(s)
### Aliases: style

### ** Examples


p <- qplot(data = mtcars, wt, mpg, geom = c("point", "smooth"))
# keep the hover info for points, but remove it for the line/ribbon
style(p, hoverinfo = "none", traces = c(2, 3))




