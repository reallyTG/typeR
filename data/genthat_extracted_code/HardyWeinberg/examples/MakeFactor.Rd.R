library(HardyWeinberg)


### Name: MakeFactor
### Title: Make factors from genotyping data
### Aliases: MakeFactor
### Keywords: misc

### ** Examples

y <- c(1,1,0,0,2,2)
data.frame(y,MakeFactor(y))

y <- c(2,2,3,3,1,1)
data.frame(y,MakeFactor(y,coding=c(1,2,3)))

data(Markers)
data.frame(Markers[,1],MakeFactor(Markers[,1],coding=c(1,2,3)))



