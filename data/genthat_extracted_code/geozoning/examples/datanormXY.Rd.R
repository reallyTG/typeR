library(geozoning)


### Name: datanormXY
### Title: normalize data coords
### Aliases: datanormXY
### Keywords: internal

### ** Examples

nPoints=500
x=runif(nPoints, min=0, max=1)
y=runif(nPoints, min=0, max=1)
range(x) # not [0,1]
tabData=data.frame(x=x,y=y)
tabData=geozoning:::datanormXY(tabData) # x,y ranges are now [0,1]



