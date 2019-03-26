library(ggiraphExtra)


### Name: ggDensity
### Title: Make a density plot with histogram
### Aliases: ggDensity

### ** Examples

require(ggplot2)
require(moonBook)
ggDensity(acs,aes(x=age))
ggDensity(acs,aes(x=age,color=sex,fill=sex),addhist=FALSE)
ggDensity(acs,aes(x=age,color=sex,fill=sex))
ggDensity(acs,aes(x=age,fill=sex),addhist=FALSE)
ggDensity(acs,aes(x=age,color=sex))



