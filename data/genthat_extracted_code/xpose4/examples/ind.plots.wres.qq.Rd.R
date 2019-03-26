library(xpose4)


### Name: ind.plots.cwres.qq
### Title: Quantile-quantile plots of weighted residuals for each
###   individual in an Xpose data object, for Xpose 4
### Aliases: ind.plots.cwres.qq ind.plots.wres.qq
### Keywords: methods

### ** Examples

## Here we load the example xpose database 
xpdb <- simpraz.xpdb

ind.plots.wres.qq(xpdb)

## Use CWRES instead
ind.plots.cwres.qq(xpdb,grid=TRUE,subset="ID<10")

## Use NPDEs instead
ind.plots.wres.qq(xpdb,grid=TRUE,subset="ID<10",wres="NPDE")




