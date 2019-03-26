library(ConSpline)


### Name: ConSpline-package
### Title: Partial Linear Least-squares Regression with Constrained Splines
### Aliases: ConSpline-package ConSpline
### Keywords: Partial Linear Least-Squares splines shape constraint
###   monotone package

### ** Examples

data(WhiteSpruce)
plot(WhiteSpruce$Diameter,WhiteSpruce$Height)
ans=conspline(WhiteSpruce$Height,WhiteSpruce$Diameter,7)
lines(sort(WhiteSpruce$Diameter),ans$muhat[order(WhiteSpruce$Diameter)])



