library(ecotoxicology)


### Name: ArcsinToPercentage
### Title: Convert Arcsin values to percentages
### Aliases: ArcsinToPercentage

### ** Examples

a<-c(.1,.5,1:10,50,96,97,98,99.5,99.99,99.999,99.9999)
b<-PercentageToProbit(a)
d<-ProbitToPercentage(b)
e<-PercentageToArcsin(d)
f<-ArcsinToPercentage(e)



