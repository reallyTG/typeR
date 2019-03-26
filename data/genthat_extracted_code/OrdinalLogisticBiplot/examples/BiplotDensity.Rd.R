library(OrdinalLogisticBiplot)


### Name: BiplotDensity
### Title: Density plot of a data set with overlaid contours.
### Aliases: BiplotDensity
### Keywords: Density

### ** Examples

data(LevelSatPhd)
olbo = OrdinalLogisticBiplot(LevelSatPhd)
x = olbo$RowCoords[, 1]
y = olbo$RowCoords[, 2]
plot(x,y, cex = 0, xlim=c(-1,1),ylim=c(-1,1))
X = olbo$RowCoords
y = as.matrix(as.numeric(LevelSatPhd[,4]))
gcols = c("midnightblue","black","red","gray87")
BiplotDensity(X,y,groupcols = gcols)



