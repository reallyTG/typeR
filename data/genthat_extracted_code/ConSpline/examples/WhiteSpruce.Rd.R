library(ConSpline)


### Name: WhiteSpruce
### Title: Height and Diameter of 36 White Spruce trees.
### Aliases: WhiteSpruce
### Keywords: datasets

### ** Examples

data(WhiteSpruce)
plot(WhiteSpruce$Diameter,WhiteSpruce$Height)
ans=conspline(WhiteSpruce$Height,WhiteSpruce$Diameter,7)
lines(sort(WhiteSpruce$Diameter),ans$muhat[order(WhiteSpruce$Diameter)])



