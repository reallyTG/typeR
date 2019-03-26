library(ggiraphExtra)


### Name: ggPair
### Title: Make an interactive scatter and line plot
### Aliases: ggPair

### ** Examples

require(ggplot2)
require(ggiraph)
require(sjmisc)
require(moonBook)
ggPair(iris,rescale=TRUE,horizontal=TRUE)
ggPair(acs,aes(colour=smoking),horizontal=TRUE,rescale=TRUE)
ggPair(radial,aes(color=male),horizontal=TRUE,rescale=TRUE)
ggPair(mtcars,horizontal=TRUE,rescale=TRUE)
ggPair(iris,rescale=TRUE,horizontal=TRUE,interactive=TRUE)
ggPair(iris,aes(color=Species),rescale=TRUE,interactive=TRUE)
ggPair(iris,aes(x=c(Sepal.Length,Sepal.Width),color=Species),horizontal=TRUE,interactive=TRUE)



