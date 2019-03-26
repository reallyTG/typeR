library(gtable)


### Name: gtable_col
### Title: Create a single column gtable.
### Aliases: gtable_col

### ** Examples

library(grid)
a <- rectGrob(gp = gpar(fill = "red"))
b <- circleGrob()
c <- linesGrob()
gt <- gtable_col("demo", list(a, b, c))
gt
plot(gt)
gtable_show_layout(gt)



