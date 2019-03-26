library(OrdinalLogisticBiplot)


### Name: OrdinalLogisticBiplot-package
### Title: Ordinal Logistic Biplot representations for polytomous ordered
###   data.
### Aliases: OrdinalLogisticBiplot-package
### Keywords: package

### ** Examples

data(LevelSatPhd)
olbo = OrdinalLogisticBiplot(LevelSatPhd,sFormula=NULL,numFactors=2,
method="EM",penalization=0.2,show=FALSE)
summary(olbo)
plot(olbo,PlotInd=TRUE,xlimi=-1,xlimu=1,ylimi=-1,ylimu=1,margin = 0.2,
ColorVar = c("red","green","black","blue","yellow"),CexVar = c(0.7),showIIC=FALSE)




