library(reshape2)


### Name: melt.data.frame
### Title: Melt a data frame into form suitable for easy casting.
### Aliases: melt.data.frame
### Keywords: manip

### ** Examples

names(airquality) <- tolower(names(airquality))
melt(airquality, id=c("month", "day"))
names(ChickWeight) <- tolower(names(ChickWeight))
melt(ChickWeight, id=2:4)



