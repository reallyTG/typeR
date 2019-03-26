library(ggiraphExtra)


### Name: ggArea
### Title: Draw an interactive area plot
### Aliases: ggArea

### ** Examples

require(gcookbook)
require(ggplot2)
ggArea(uspopage,aes(x=Year,y=Thousands,fill=AgeGroup))
ggArea(uspopage,aes(x=Year,y=Thousands,fill=AgeGroup),position="fill")



