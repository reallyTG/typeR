library(braidReports)


### Name: responseMap
### Title: Visualizing Combination Response Maps
### Aliases: responseMap responseMap.default responseMap.formula
### Keywords: hplot

### ** Examples

data(es8olatmz,package="braidrm")
rmap <- responseMap(act~conc1+conc2,es8olatmz)
formatResponseMap(rmap,xl="Olaparib",yl="TMZ",zl="Survival")
rmap <- responseMap(act~conc1+conc2,es8olatmz,interpolate=FALSE,margins=FALSE)
formatDifferenceMap(rmap,zcenter=-1,xl="Olaparib",yl="TMZ",zl="Survival")



