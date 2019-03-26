library(Rearrangement)


### Name: rconint
### Title: Rearrangement of Simultaneous Confidence Intervals
### Aliases: rconint
### Keywords: optimize manip regression models

### ** Examples

## Not run: 
##D data(GrowthChart)
##D attach(GrowthChart)
##D 
##D nage <- 2 * pi * (age - min(age)) / (max(age) - min(age))
##D formula <- height ~ I(sin(nage))+I(cos(nage))+I(sin(2*nage))+I(cos(2*nage))+
##D             I(sin(3*nage))+I(cos(3*nage))+I(sin(4*nage))+I(cos(4*nage))
##D j <- simconboot(nage,height,lm,formula)
##D k <- rconint(j)
##D plot(k, border=NA, col='darkgray',xlab = 'Age (years)',ylab = 'Height (cms)',xaxt = "n")
##D axis(1, at = seq(-2*pi*min(age)/(max(age)-min(age)), 
##D         2*pi+1,by=5*2*pi/(max(age)-min(age))), label = seq(0, max(age)+1, by=5))
##D polygon.conint(j, border=NA, col='lightgray')
##D polygon.conint(k, border=NA, col='darkgray', density=50)
##D points(nage,height,col='gray80')
##D legend(min(nage),max(height),c("95% CI Original",
##D        "95% CI  Rearranged"),lty=c(1,1),lwd=c(2,2),
##D        col=c("lightgray","darkgray"),bty="n");
##D detach(GrowthChart)
## End(Not run)



