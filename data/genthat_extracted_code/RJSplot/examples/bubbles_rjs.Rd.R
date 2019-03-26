library(RJSplot)


### Name: bubbles_rjs
### Title: Produce interactive bubble plots.
### Aliases: bubbles_rjs

### ** Examples

## Create an interactive barplot in the folder "BubblePlot" of your local machine
## Live examples on http://rjsplot.net
bubbles_rjs(scale(mtcars[,c("mpg","hp")],FALSE),mtcars$wt)



