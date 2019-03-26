library(ggiraphExtra)


### Name: ggRadar
### Title: Draw a radar chart
### Aliases: ggRadar

### ** Examples

require(ggplot2)
require(ggiraph)
require(plyr)
require(reshape2)
require(moonBook)
require(sjmisc)
ggRadar(data=iris,aes(group=Species))
ggRadar(data=mtcars,interactive=TRUE)
ggRadar(data=mtcars,aes(colour=am,facet=cyl),interactive=TRUE)
ggRadar(data=acs,aes(colour=Dx,facet=Dx))
ggRadar(iris,aes(x=c(Sepal.Length,Sepal.Width,Petal.Length,Petal.Width)))



