library(qualityTools)


### Name: lows-methods
### Title: Get and set methods
### Aliases: lows lows<- lows-methods lows,facDesign-method
###   lows<-,facDesign-method lows,mixDesign-method lows<-,mixDesign-method

### ** Examples

fdo = facDesign(k=3)
lows(fdo) = c(10, 160, 1)
lows(fdo) = c(20, 200, 2)
summary(fdo)



