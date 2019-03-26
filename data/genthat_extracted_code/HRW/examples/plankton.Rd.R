library(HRW)


### Name: plankton
### Title: Flow cytometric measurements on plankton organisms
### Aliases: plankton

### ** Examples

library(HRW) ; data(plankton)
pointCols <- c("red","blue","green","orange","purple")
pairs(plankton[,1:6],col = pointCols[plankton$species],pch = ".")



