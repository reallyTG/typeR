library(Rearrangement)


### Name: points.conint
### Title: Points Method for Simultaneous Confidence Intervals
### Aliases: points.conint
### Keywords: aplot

### ** Examples

data(GrowthChart)
attach(GrowthChart)

nage <- 2 * pi * (age - min(age)) / (max(age) - min(age))
formula<-height~I(sin(nage))+I(cos(nage))+I(sin(2*nage))+I(cos(2*nage))+
          I(sin(3*nage))+I(cos(3*nage))+I(sin(4*nage))+I(cos(4*nage))
j <- simconboot(nage,height,lm,formula)
plot(nage,height,pch=21,bg='gray',cex=.5,xlab="Age (years)",ylab="Height (cms)",col="gray")
points(j)

detach(GrowthChart)



