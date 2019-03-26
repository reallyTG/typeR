library(ggiraphExtra)


### Name: ggPieDonut
### Title: Draw a Pie and Donut plot
### Aliases: ggPieDonut

### ** Examples

require(ggplot2)
require(ggiraph)
require(plyr)
require(moonBook)
ggPieDonut(acs,aes(pies=Dx,donuts=smoking))
ggPieDonut(acs,aes(pies=smoking))
ggPieDonut(browsers,aes(pies=browser,donuts=version,count=share))
ggPieDonut(browsers,aes(x=c(browser,version),y=share),interactive=TRUE)



