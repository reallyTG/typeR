library(intRvals)


### Name: plot.intRvals
### Title: Plot an interval histogram and fit of intRvals object
### Aliases: plot.intRvals

### ** Examples

data(goosedrop)
dr=estinterval(goosedrop$interval)
plot(dr)
plot(dr,binsize=10,line.col='blue')



