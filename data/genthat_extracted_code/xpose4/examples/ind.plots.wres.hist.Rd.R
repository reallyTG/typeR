library(xpose4)


### Name: ind.plots.cwres.hist
### Title: Histograms of weighted residuals for each individual in an Xpose
###   data object, for Xpose 4
### Aliases: ind.plots.cwres.hist ind.plots.wres.hist

### ** Examples

## Here we load the example xpose database 
xpdb <- simpraz.xpdb

## A vanilla plot
ind.plots.wres.hist(xpdb)

## subsets
ind.plots.wres.hist(xpdb, subset="ID<10 | ID>45",grid=TRUE)

## plot the CWRES instead
ind.plots.cwres.hist(xpdb)




