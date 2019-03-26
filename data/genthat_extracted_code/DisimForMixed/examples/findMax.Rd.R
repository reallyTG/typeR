library(DisimForMixed)


### Name: findMax
### Title: Calculate Distance Between given Attribute Values by considering
###   only a pair of attributes.
### Aliases: findMax

### ** Examples

Attrib_i <- c("A","B","A","C")
Attrib_j <- c("Q","Q","R","Q")
xVal <- "A"
yVal <- "B"
QualiVars <- data.frame(Qlvar1 = c("A","B","A","C"), Qlvar2 = c("Q","Q","R","Q"))
library(dplyr)
distBetXY <- findMax(Attrib_i,Attrib_j,xVal,yVal)



