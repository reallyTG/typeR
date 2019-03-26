library(ggiraphExtra)


### Name: ggHeatmap
### Title: Make an interactive Heatmap
### Aliases: ggHeatmap

### ** Examples

require(moonBook)
require(ggplot2)
require(ggiraph)
require(sjmisc)
ggHeatmap(acs,aes(x=Dx,y=smoking),addlabel=TRUE,interactive=TRUE)
ggHeatmap(acs,aes(x=sex,y=Dx,fill=age),addlabel=TRUE,interactive=TRUE)
ggHeatmap(rose,aes(x=Month,y=group,fill=value),stat="identity",addlabel=TRUE)
ggHeatmap(rose,aes(x=Month,y=group,fill=value),addlabel=TRUE)
ggHeatmap(taco,aes(x=AgeGroup,y=Filling,fill=Rating,facet=ShellType),color="grey50",stat="identity")



