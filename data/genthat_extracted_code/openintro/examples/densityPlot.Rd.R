library(openintro)


### Name: densityPlot
### Title: Density plot
### Aliases: densityPlot

### ** Examples

data(tips)
par(mfrow=c(2,2))
histPlot(tips$tip[tips$day == 'Tuesday'], hollow=TRUE, xlim=c(0, 30),
	lty=1, main='Tips by day')
histPlot(tips$tip[tips$day == 'Friday'], hollow=TRUE, border='red',
	add=TRUE, main='Tips by day')
legend('topright', col=c('black', 'red'), lty=1:2,
	legend=c('Tuesday', 'Friday'))
densityPlot(tips$tip, tips$day, col=c('black', 'red'), main='Tips by day')
legend('topright', col=c('black', 'red'), lty=1:2,
	legend=c('Tuesday', 'Friday'))
data(run10)
densityPlot(run10$time, histo='faded', breaks=15, main='Run time')
densityPlot(run10$time, histo='hollow', breaks=30, fadingBorder='66',
	lty=1, main='Run time')



