library(pastecs)


### Name: regconst
### Title: Regulate a series using the constant value method
### Aliases: regconst
### Keywords: ts manip chron smooth

### ** Examples

data(releve)
reg <- regconst(releve$Day, releve$Melosul)
plot(releve$Day, releve$Melosul, type="l")
lines(reg$x, reg$y, col=2)



