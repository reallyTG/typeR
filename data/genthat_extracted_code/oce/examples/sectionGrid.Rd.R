library(oce)


### Name: sectionGrid
### Title: Grid a Section
### Aliases: sectionGrid

### ** Examples

# Gulf Stream
library(oce)
data(section)
GS <- subset(section, 109<=stationId&stationId<=129)
GSg <- sectionGrid(GS, p=seq(0, 5000, 100))
plot(GSg, map.xlim=c(-80,-60))




