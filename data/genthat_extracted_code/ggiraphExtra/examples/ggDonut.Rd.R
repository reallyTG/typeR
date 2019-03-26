library(ggiraphExtra)


### Name: ggDonut
### Title: Draw a Donut plot
### Aliases: ggDonut

### ** Examples

require(ggplot2)
require(ggiraph)
require(plyr)
ggDonut(browsers,aes(donuts=version,count=share))
ggDonut(browsers,aes(donuts=version,count=share),palette="Reds",explode=c(2,4,6),labelposition=0)



