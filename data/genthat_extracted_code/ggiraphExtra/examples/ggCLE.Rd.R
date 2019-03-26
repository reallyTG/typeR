library(ggiraphExtra)


### Name: ggCLE
### Title: Draw a cleveland dot plot
### Aliases: ggCLE

### ** Examples

require(ggplot2)
require(ggiraph)
ggCLE(data=mtcars,aes(x=mpg),decreasing=FALSE,interactive=TRUE)
ggCLE(data=mtcars,aes(x=mpg,color=am,facet=am),interactive=TRUE)
if(requireNamespace("gcookbook",quietly=TRUE)){
   require(gcookbook)
   ggCLE(data=tophitters2001,aes(x=avg,y=name,color=lg,facet=lg),no=30,interactive=TRUE)
}



