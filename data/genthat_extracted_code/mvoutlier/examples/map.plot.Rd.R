library(mvoutlier)


### Name: map.plot
### Title: Plot Multivariate Outliers in a Map
### Aliases: map.plot
### Keywords: dplot

### ** Examples

data(humus) # Load humus data
xy <- humus[,c("XCOO","YCOO")] # X and Y Coordinates
myhumus <- log(humus[, c("As", "Cd", "Co", "Cu", "Mg", "Pb", "Zn")])
map.plot(xy, myhumus, symb=TRUE)



