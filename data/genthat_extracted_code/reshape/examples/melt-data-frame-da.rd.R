library(reshape)


### Name: melt.data.frame
### Title: Melt a data frame
### Aliases: melt.data.frame
### Keywords: manip

### ** Examples
head(melt(tips))
names(airquality) <- tolower(names(airquality))
melt(airquality, id=c("month", "day"))
names(ChickWeight) <- tolower(names(ChickWeight))
melt(ChickWeight, id=2:4)


