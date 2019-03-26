library(openintro)


### Name: histPlot
### Title: Histogram or hollow histogram
### Aliases: histPlot

### ** Examples

data(run10)
par(mfrow=c(2,2))
histPlot(run10$time)
histPlot(run10$time[run10$gender=='M'], probability=TRUE, xlim=c(30, 180),
	ylim=c(0, 0.025), hollow=TRUE)
histPlot(run10$time[run10$gender=='F'], probability=TRUE, add=TRUE,
	hollow=TRUE, lty=3, border='red')
legend('topleft', col=c('black', 'red'), lty=2:3, legend=c('M','F'))
histPlot(run10$time, col=fadeColor('yellow', '33'), border='darkblue',
	probability=TRUE, breaks=30, lwd=3)
brks <- c(40, 50, 60, 65, 70, 75, 80, seq(82.5, 120, 2.5), 125,
	130, 135, 140, 150, 160, 180)
histPlot(run10$time, probability=TRUE, breaks=brks,
	col=fadeColor('darkgoldenrod4', '33'))



