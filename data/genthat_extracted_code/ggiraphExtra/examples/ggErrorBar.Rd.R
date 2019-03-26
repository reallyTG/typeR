library(ggiraphExtra)


### Name: ggErrorBar
### Title: Make an interactive bar plot with error bar
### Aliases: ggErrorBar

### ** Examples

require(ggplot2)
require(ggiraph)
ggErrorBar(mpg,aes(x=drv,y=cty))
ggErrorBar(mpg,aes(x=drv,y=hwy,color=cyl),mode=1,interactive=TRUE,errorbar="sd")



