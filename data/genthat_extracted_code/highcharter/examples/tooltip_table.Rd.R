library(highcharter)


### Name: tooltip_table
### Title: Helper for make table in tooltips
### Aliases: tooltip_table

### ** Examples


x <- c("Income:", "Genre", "Runtime")
y <- c("$ {point.y}", "{point.series.options.extra.genre}",
       "{point.series.options.extra.runtime}")

tooltip_table(x, y)




