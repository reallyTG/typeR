library(Rearrangement)


### Name: plot.conint
### Title: Plot Method for Simultaneous Confidence Intervals
### Aliases: plot.conint
### Keywords: device

### ** Examples

data(GrowthChart)
attach(GrowthChart)

nage <- 2 * pi * (age - min(age)) / (max(age) - min(age))
formula <- height ~ I(sin(nage))+I(cos(nage))+I(sin(2*nage))+I(cos(2*nage))+
            I(sin(3*nage))+I(cos(3*nage))+ I(sin(4*nage))+I(cos(4*nage))
j<-simconboot(nage,height,lm,formula)
plot(j)
points(nage,height)

detach(GrowthChart)



