library(openintro)


### Name: friday
### Title: Friday the 13th
### Aliases: friday
### Keywords: datasets

### ** Examples

data(friday)
par(mfrow = c(1,2))
boxPlot(friday$sixth[friday $type == "traffic"], xlab = "sixth")
boxPlot(friday$thirteenth[friday $type == "traffic"], xlab = "thirteenth")



