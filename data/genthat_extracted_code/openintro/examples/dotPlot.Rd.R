library(openintro)


### Name: dotPlot
### Title: Dot plot
### Aliases: dotPlot

### ** Examples

#===> example 1 <===#
data(cars)
dotPlot(cars$price, cars$type, key=c('large', 'midsize', 'small'), cex=1:3)

#===> example 2 <===#
data(run10)
layout(matrix(1:2,2), heights=c(2.7,1.5))
par(las=1)
these <- run10$gender=='M'
dotPlot(run10$time[these], run10$div[these],
	col=fadeColor('black', '11'))
# disorganized levels in the above plot, which we could
# organize with key. an example of organizing the levels...
dotPlot(run10$time[these], run10$div[these],
	col=fadeColor('black', '11'),
	key=c('20-24', '25-29', '30-34', '35-39'))
par(las=0, mfrow=c(1,1))

#===> example 3 <===#
data(marioKart)
dotPlot(marioKart$totalPr, marioKart$cond, ylim=c(0.5,2.5),
	xlim=c(25, 80), cex=1) # miss the outliers
boxPlot(marioKart$totalPr, marioKart$cond, add=1:2+0.1,
	key=c('new', 'used'), horiz=TRUE, axes=FALSE)



