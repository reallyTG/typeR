library(ggiraphExtra)


### Name: ggRose
### Title: Draw an interactive Rose plot
### Aliases: ggRose

### ** Examples

require(moonBook)
require(ggplot2)
require(ggiraph)
require(plyr)
ggRose(rose,aes(x=Month,fill=group,y=value),stat="identity",interactive=TRUE)
ggRose(acs,aes(x=Dx,fill=smoking),interactive=TRUE)



