library(ggiraphExtra)


### Name: ggPoints
### Title: Make an interactive scatterplot with regression line(s)
### Aliases: ggPoints

### ** Examples

require(ggplot2)
require(ggiraph)
require(plyr)
ggPoints(aes(x=wt,y=mpg,fill=am),data=mtcars)
ggPoints(aes(x=wt,y=mpg),data=mtcars)
ggPoints(aes(x=wt,y=mpg,fill=am),data=mtcars,method="lm",interactive=TRUE)
ggPoints(aes(x=wt,y=mpg,color=am),data=mtcars,interactive=TRUE)



