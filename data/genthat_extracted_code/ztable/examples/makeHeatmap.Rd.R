library(ztable)


### Name: makeHeatmap
### Title: Add gradient background color to ztable
### Aliases: makeHeatmap

### ** Examples

require(magrittr)
ztable(head(mtcars)) %>% makeHeatmap
ztable(head(mtcars)) %>% makeHeatmap(palette="YlOrRd",cols=c(1,4,6),margin=2)
ztable(head(mtcars)) %>% makeHeatmap(rows=c(1,3,5),margin=1)
require(moonBook)
x=table(acs$smoking,acs$Dx)
ztable(x) %>% makeHeatmap
ztable(x) %>% makeHeatmap(palette="Blues")
ztable(x) %>% makeHeatmap(mycolor=gradientColor(low="yellow",mid="orange",high="red"))



