library(ggiraphExtra)


### Name: ggViolin
### Title: Draw violin plots of a data.frame
### Aliases: ggViolin

### ** Examples

require(ggplot2)
require(ggiraph)
require(reshape2)
ggViolin(iris)
ggViolin(iris,aes(fill=Species),rescale=TRUE)
ggViolin(mtcars,aes(x=c(mpg,cyl,disp,hp,drat),color=am),rescale=TRUE)
ggViolin(mtcars,aes(x=c(mpg,cyl,disp,hp,drat)),rescale=TRUE)



