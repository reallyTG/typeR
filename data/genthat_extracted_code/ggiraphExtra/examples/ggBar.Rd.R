library(ggiraphExtra)


### Name: ggBar
### Title: Draw an interactive barplot
### Aliases: ggBar

### ** Examples

require(moonBook)
require(ggplot2)
require(ggiraph)
require(plyr)
ggBar(acs,aes(x=Dx,fill=smoking),interactive=TRUE,width=1,colour="white",size=0.2,polar=TRUE)
ggBar(acs,aes(x=Dx,fill=smoking),position="fill",addlabel=TRUE,horizontal=TRUE,width=0.5)
ggBar(acs,aes(x=Dx,fill=smoking),position="dodge",interactive=TRUE,addlabel=TRUE)
ggBar(acs,aes(x=Dx,fill=smoking),position="fill",addlabel=TRUE)
ggBar(rose,aes(x=Month,fill=group,y=value),stat="identity",polar=TRUE,palette="Reds",width=1,
      color="black",size=0.1,reverse=TRUE,interactive=TRUE)



