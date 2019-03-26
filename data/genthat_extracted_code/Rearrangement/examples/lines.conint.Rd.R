library(Rearrangement)


### Name: lines.conint
### Title: Lines Method for Simultaneous Confidence Intervals
### Aliases: lines.conint
### Keywords: aplot

### ** Examples

data(GrowthChart)
attach(GrowthChart)

nage <- 2*pi*(age-min(age))/(max(age)-min(age))
formula<-height~I(sin(nage))+I(cos(nage))+I(sin(2*nage))+
          I(cos(2*nage))+I(sin(3*nage))+ I(cos(3*nage))+I(sin(4*nage))+I(cos(4*nage))		  
		  
j<-simconboot(nage,height,lm,formula)
plot(nage,height,pch=21,bg='gray',cex=.5,xlab="Age (years)",ylab="Height (cms)",col='gray',xaxt='n')
axis(1, at = seq(-2*pi*min(age)/(max(age)-min(age)), 
     2*pi+1, by=5*2*pi/(max(age)-min(age))), label = seq(0, max(age)+1, by=5))
lines(j)

detach(GrowthChart)



