library(plotly)


### Name: hide_legend
### Title: Hide legend
### Aliases: hide_legend

### ** Examples


p <- plot_ly(mtcars, x = ~wt, y = ~cyl, color = ~factor(cyl))
hide_legend(p)



