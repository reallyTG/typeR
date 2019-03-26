library(openintro)


### Name: tips
### Title: Tip data
### Aliases: tips
### Keywords: datasets

### ** Examples

data(tips)
par(mfrow=c(2,2))
boxPlot(tips$tip, tips$day)
densityPlot(tips$tip, tips$week, key=1:3)
legend('topright', lty=1:3, col=c('black', 'red', 'blue'), legend=1:3)
dotPlot(tips$tip)
densityPlot(tips$tip, tips$day)
legend('topright', col=c('black','red'), lty=1:2,
	legend=c('Tuesday', 'Friday'))



