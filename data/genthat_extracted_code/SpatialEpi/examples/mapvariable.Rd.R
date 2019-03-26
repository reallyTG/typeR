library(SpatialEpi)


### Name: mapvariable
### Title: Plot Levels of a Variable in a Colour-Coded Map
### Aliases: mapvariable
### Keywords: file

### ** Examples

data(scotland)
map <- scotland$spatial.polygon
y <- scotland$data$cases
E <- scotland$data$expected
SMR <- y/E
mapvariable(SMR,map,main="Scotland",xlab="Eastings (km)",ylab="Northings (km)")



