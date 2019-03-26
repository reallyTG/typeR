library(ggiraphExtra)


### Name: ggBoxplot
### Title: Draw boxplots of a data.frame
### Aliases: ggBoxplot

### ** Examples

require(ggplot2)
require(ggiraph)
require(reshape2)
ggBoxplot(mtcars,rescale=TRUE)
ggBoxplot(mtcars,aes(x=c(mpg,cyl,disp,hp,drat),color=am),rescale=TRUE)
ggBoxplot(mtcars,aes(x=c(mpg,cyl,disp,hp,drat)),rescale=TRUE)
ggBoxplot(mtcars,rescale=TRUE,interactive=TRUE)
ggBoxplot(mtcars,horizontal=TRUE,interactive=TRUE)



