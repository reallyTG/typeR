library(pastecs)


### Name: regarea
### Title: Regulate a series using the area method
### Aliases: regarea
### Keywords: ts manip chron smooth

### ** Examples

data(releve)
# The 'Melosul' series is regulated with a 25-days window
reg <- regarea(releve$Day, releve$Melosul, window=25)
# Then with a 50-days window
reg2 <- regarea(releve$Day, releve$Melosul, window=50)
# The initial and both regulated series are shown on the graph for comparison
plot(releve$Day, releve$Melosul, type="l")
lines(reg$x, reg$y, col=2)
lines(reg2$x, reg2$y, col=4)



