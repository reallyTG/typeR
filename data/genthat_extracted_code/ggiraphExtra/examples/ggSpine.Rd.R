library(ggiraphExtra)


### Name: ggSpine
### Title: Draw an interactive spinogram
### Aliases: ggSpine

### ** Examples

require(moonBook)
require(ggplot2)
acs$Dx=factor(acs$Dx,levels=c("Unstable Angina","NSTEMI","STEMI"))
ggSpine(data=acs,aes(x=age,fill=Dx,facet=sex),palette="Reds")
ggSpine(data=acs,aes(x=age,fill=Dx,facet=sex),facetbycol=FALSE,minlabelgroup=0.02)
ggSpine(data=acs,aes(x=age,fill=Dx),palette="Reds")
ggSpine(data=acs,aes(x=smoking,fill=Dx),palette="Reds")
ggSpine(data=acs,aes(x=DM,fill=Dx,facet=sex),palette="Reds")
ggSpine(data=acs,aes(x=Dx,fill=smoking,facet=sex),palette="Reds")
ggSpine(data=acs,aes(x=DM,facet=smoking,fill=Dx),sec.y.axis=TRUE)
ggSpine(data=acs,aes(x=DM,facet=smoking,fill=Dx),facetbycol=FALSE)
ggSpine(mtcars,aes(x=gear,fill=carb))
ggSpine(mtcars,aes(x=gear,fill=carb,facet=am))
ggSpine(data=acs,aes(x=Dx,fill=smoking),position="dodge")
ggSpine(data=acs,aes(x=Dx,fill=smoking),position="stack")



