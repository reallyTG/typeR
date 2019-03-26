library(pastecs)


### Name: regspline
### Title: Regulation of a time series using splines
### Aliases: regspline
### Keywords: ts manip chron smooth

### ** Examples

data(releve)
reg <- regspline(releve$Day, releve$Melosul)
plot(releve$Day, releve$Melosul, type="l")
lines(reg$x, reg$y, col=2)



