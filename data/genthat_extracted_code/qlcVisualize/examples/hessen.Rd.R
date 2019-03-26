library(qlcVisualize)


### Name: hessen
### Title: Extract from the SyHD Project on the syntax of the dialect of
###   Hessen (Germany)
### Aliases: hessen
### Keywords: datasets

### ** Examples

data(hessen)

tessalation <- voronoi(hessen$villages, hessen$boundary)
plot(tessalation)



