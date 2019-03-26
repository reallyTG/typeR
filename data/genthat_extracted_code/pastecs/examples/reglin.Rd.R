library(pastecs)


### Name: reglin
### Title: Regulation of a series using a linear interpolation
### Aliases: reglin
### Keywords: ts manip chron smooth

### ** Examples

data(releve)
reg <- reglin(releve$Day, releve$Melosul)
plot(releve$Day, releve$Melosul, type="l")
lines(reg$x, reg$y, col=2)



