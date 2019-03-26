library(SpatialEpi)


### Name: plotmap
### Title: Plot Levels of a Variable in a Colour-Coded Map
### Aliases: plotmap
### Keywords: file

### ** Examples

## Load data
data(scotland)
map <- scotland$spatial.polygon
y <- scotland$data$cases
E <- scotland$data$expected
SMR <- y/E

## Plot SMR
plotmap(SMR, map, nclr=9, location="topleft")



