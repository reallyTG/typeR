library(OrdinalLogisticBiplot)


### Name: plot.ordinal.logistic.biplot
### Title: Graphical representation of an Ordinal Logistic Biplot.
### Aliases: plot.ordinal.logistic.biplot
### Keywords: plot

### ** Examples

data(LevelSatPhd)
olbo = OrdinalLogisticBiplot(LevelSatPhd,penalization=0.2)
plot(olbo,PlotInd=TRUE,xlimi=-1.5,xlimu=1.5,ylimi=-1.5,ylimu=1.5,
  margin = 0.2, ColorVar = c("red","green","black","blue","yellow"),
  CexVar = c(0.7),showIIC=FALSE)



