library(openintro)


### Name: possum
### Title: possum
### Aliases: possum
### Keywords: datasets

### ** Examples

data(possum)
par(mfrow=1:2)
plot(possum$headL, possum$skullW)
densityPlot(possum$totalL, possum$sex, key=c('f','m'),
	xlab='total length (cm)')
legend('topright', col=c('black', 'red'), lty=1:2, legend=c('f', 'm'))



