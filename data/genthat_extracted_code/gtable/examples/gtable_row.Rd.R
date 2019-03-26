library(gtable)


### Name: gtable_row
### Title: Create a single row gtable.
### Aliases: gtable_row

### ** Examples

library(grid)
a <- rectGrob(gp = gpar(fill = "red"))
b <- circleGrob()
c <- linesGrob()
gt <- gtable_row("demo", list(a, b, c))
gt
plot(gt)
gtable_show_layout(gt)



