library(Gmisc)


### Name: bezierArrowSmpl
### Title: A simple bezier arrow
### Aliases: bezierArrowSmpl

### ** Examples

library(grid)
grid.newpage()
arrowGrob <- bezierArrowSmpl(x = c(.1,.3,.6,.9),
                             y = c(0.2, 0.2, 0.9, 0.9))
grid.draw(arrowGrob)




