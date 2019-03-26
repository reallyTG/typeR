library(plotfunctions)


### Name: emptyPlot
### Title: Utility function
### Aliases: emptyPlot

### ** Examples

# generate some measurements:
x <- runif(100,0,100)
y <- rpois(100,lambda=3)

# Setup empty plot window fitting for data:
emptyPlot(range(x), range(y))
# To add data, use lines() and points()
points(x,y, pch=16, col=alpha('steelblue'))

# Category labels:
emptyPlot(toupper(letters[1:5]), 1)
# order matters:
emptyPlot(sample(toupper(letters[1:5])), 1)
# actually, they are plotted on x-positions 1:5
points(1:5, rnorm(5, mean=.5, sd=.1))
# also possible for y-axis or both:
emptyPlot(c(200,700), toupper(letters[1:5]))
emptyPlot(as.character(8:3), toupper(letters[1:5]))
# change orientation of labels:
par(las=1)
emptyPlot(c(200,700), toupper(letters[1:5]))
par(las=0) # set back to default

# More options:
emptyPlot(range(x), range(y),
    main='Data', ylab='Y', xlab='Time')
# add averages:
m <- tapply(y, list(round(x/10)*10), mean)
lines(as.numeric(names(m)), m, type='o', pch=4)

# with vertical and horizontal lines:
emptyPlot(1, 1, h0=.5, v0=.75)
# eeg axis (note the axes labels):
emptyPlot(c(-200,1000), c(-5,5),
    main="EEG", v0=0, h0=0,
    eegAxis=TRUE)

# empty window:
emptyPlot(1,1,axes=FALSE)
# add box:
emptyPlot(1,1, bty='o')




