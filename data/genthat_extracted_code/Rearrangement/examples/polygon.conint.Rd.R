library(Rearrangement)


### Name: polygon.conint
### Title: polygon Method for Simultaneous Confidence Intervals
### Aliases: polygon.conint
### Keywords: aplot

### ** Examples


## Not run: 
##D data(GrowthChart)
##D attach(GrowthChart)
##D 
##D nage <- 2 * pi * (age - min(age)) / (max(age) - min(age))
##D formula <- height~I(sin(nage))+I(cos(nage))+I(sin(2*nage))+I(cos(2*nage))+
##D             I(sin(3*nage))+I(cos(3*nage))+I(sin(4*nage))+I(cos(4*nage))
##D j<-simconboot(nage,height,lm,formula)
##D plot(nage,height,pch=21,bg='gray',cex=0.5,xlab="Age (years)",
##D      ylab="Height (cms)",col='gray',xaxt='n')
##D axis(1, at = seq(-2*pi*min(age)/(max(age)-min(age)), 
##D         2*pi+1,by=5*2*pi/(max(age)-min(age))), label = seq(0, max(age)+1, by=5))
##D polygon.conint(j, border=NA, col='darkgray')
##D 
##D detach(GrowthChart)
## End(Not run)




