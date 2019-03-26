library(ggiraphExtra)


### Name: ggPie
### Title: Draw a pie plot
### Aliases: ggPie

### ** Examples

require(ggplot2)
require(ggiraph)
require(plyr)
require(moonBook)
ggPie(data=browsers,aes(pies=browser,count=share))
ggPie(data=acs,aes(pies=Dx))



