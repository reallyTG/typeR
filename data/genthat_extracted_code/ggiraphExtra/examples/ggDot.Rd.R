library(ggiraphExtra)


### Name: ggDot
### Title: Draw a Wilkinson dot plot
### Aliases: ggDot

### ** Examples

require(ggplot2)
if(requireNamespace("gcookbook",quietly=TRUE)){ # for data heightweight
 require(gcookbook)
 ggDot(heightweight,aes(sex,heightIn,fill=sex),boxfill="white",binwidth=0.4)
 ggDot(heightweight,aes(heightIn))
 ggDot(heightweight,aes(x=heightIn,fill=sex))
}
require(moonBook) #for use data radial
ggDot(radial,aes(x=sex,y=height,fill=sex),boxfill="white",position=0,binwidth=1,boxwidth=1)
ggDot(radial,aes(x=height,fill=sex),binwidth=1)
ggDot(acs,aes(x=sex,y=age,color=sex))
ggDot(acs,aes(x=Dx,y=age,color=Dx))



