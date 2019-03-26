library(BCEA)


### Name: ceplane.plot
### Title: Cost-effectiveness plane plot
### Aliases: ceplane.plot
### Keywords: Health economic evaluation Cost Effectiveness Plane

### ** Examples

### create the bcea object m for the smoking cessation example
data(Smoking)
m <- bcea(e,c,ref=4,Kmax=500,interventions=treats)
### produce the plot
ceplane.plot(m,wtp=200,graph="base")
### select only one comparator
ceplane.plot(m,wtp=200,graph="base",comparator=3)
### or use ggplot2 instead
if(requireNamespace("ggplot2")){
ceplane.plot(m,wtp=200,pos="right",ICER.size=2,graph="ggplot2")
}



