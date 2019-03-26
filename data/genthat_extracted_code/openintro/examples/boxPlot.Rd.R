library(openintro)


### Name: boxPlot
### Title: Box plot
### Aliases: boxPlot

### ** Examples

data(run10)
par(mfrow=1:2)

#===> comparison 1 <===#
boxPlot(run10$time)
boxplot(run10$time)

#===> comparison 2 <===#
boxPlot(run10$time, run10$gender, col=fadeColor('black', '22'))
boxplot(run10$time ~ run10$gender)

#===> modifications using boxPlot <===#
par(mfrow=c(2,2))
boxPlot(run10$time, run10$gender)
boxPlot(run10$time, run10$gender, xlab='gender',
	ylab='run time (min)',
	col=fadeColor('black', '18'))
plot(0,0, xlab='gender', ylab='run time (min)',
	xlim=c(0,6), ylim=c(30, 180), axes=FALSE)
boxPlot(run10$time, run10$gender, width=0.5, lwd=2,
	lcol=4, medianLwd=4, pch=1, pchCex=1, col=4,
	add=c(1,2,5), key=c('M','F','N'))
plot(0,0, ylab='gender', xlab='run time (min)',
	xlim=c(30, 180), ylim=c(0, 3), axes=FALSE)
boxPlot(run10$time, run10$gender, horiz=TRUE,
	xlab='run time (min)', ylab='gender',
	add=1:2, key=c('F','M'))
# 'key' can be used to restrict to only the
# desired groups

#===> combine boxPlot and dotPlot <===#
data(tips)
par(mfrow=c(1,1))
boxPlot(tips$tip, tips$day, horiz=TRUE, key=c('Tuesday', 'Friday'))
dotPlot(tips$tip, tips$day, add=TRUE, at=1:2+0.05,
	key=c('Tuesday', 'Friday'))

#===> adding a box <===#
par(mfrow=1:2)
boxPlot(run10$time[run10$gender=='M'], xlim=c(0,3))
boxPlot(run10$time[run10$gender=='F'], add=2, axes=FALSE)
axis(1, at=1:2, labels=c('M', 'F'))
boxPlot(run10$time[run10$gender=='M'], ylim=c(0,3), horiz=TRUE)
boxPlot(run10$time[run10$gender=='F'], add=2, horiz=TRUE, axes=FALSE)
axis(2, at=1:2, labels=c('M', 'F'))



