library(TauP.R)


### Name: polaraxis
### Title: Polar Plot Axis
### Aliases: polaraxis
### Keywords: misc

### ** Examples


# Borrowed from Earthplot:

par(mar = c(1.1,1.1,4.1,1.1))
plot(0,type='n',xlim = 1.15 * c(-6271, 6371),ann=FALSE,axes=FALSE,asp=1)

PolarPlot(0:360,6371,type='l',method=lines,degree=TRUE,geographical=TRUE,col='black')

polaraxis(6371)
 





