library(Gmisc)


### Name: bezierArrowGradient
### Title: A bezier arrow with gradient
### Aliases: bezierArrowGradient

### ** Examples

library(grid)
grid.newpage()
arrowGrob <- bezierArrowGradient(x = c(.1,.3,.6,.9),
                                     y = c(0.2, 0.2, 0.9, 0.9))
grid.draw(arrowGrob)



