library(ggiraphExtra)


### Name: ggCor
### Title: Draw a heatmap of correlation test
### Aliases: ggCor

### ** Examples

require(mycor)
require(ggplot2)
require(ggiraph)
require(ppcor)
ggCor(iris,digits=3,label=3)
ggCor(iris,what=3,digits=3,label=3)
ggCor(iris,label=3,interactive=TRUE)
ggCor(mtcars,interactive=TRUE)
ggCor(mtcars,mode=2,interactive=TRUE)
ggCor(iris,method="pearson",interactive=TRUE)



