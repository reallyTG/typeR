library(ggExtra)


### Name: removeGrid
### Title: Remove grid lines from ggplot2
### Aliases: removeGrid removeGrid removeGridX removeGridY

### ** Examples

df <- data.frame(x = 1:50, y = 1:50)
p <- ggplot2::ggplot(df, ggplot2::aes(x, y)) + ggplot2::geom_point()
p + removeGrid()
p + removeGrid(y = FALSE)
p + removeGridX()



