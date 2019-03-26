library(qualityTools)


### Name: highs-methods
### Title: Get and set methods
### Aliases: highs highs<- highs-methods highs,facDesign-method
###   highs<-,facDesign-method highs,mixDesign-method
###   highs<-,mixDesign-method

### ** Examples

fdo = facDesign(k=3)
lows(fdo) = c(10, 160, 1)
highs(fdo) = c(20, 200, 2)
summary(fdo)



