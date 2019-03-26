library(tactile)


### Name: bubbleplot
### Title: Bubbleplots
### Aliases: bubbleplot bubbleplot.formula

### ** Examples

bubbleplot(disp ~ hp * wt, groups = cyl, data = mtcars, auto.key = TRUE)
bubbleplot(disp ~ hp * mpg | factor(cyl), groups = gear, data = mtcars,
           auto.key = TRUE)



