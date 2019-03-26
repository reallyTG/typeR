library(braidReports)


### Name: formatResponseMap
### Title: Format Response and Error Maps
### Aliases: formatResponseMap formatDifferenceMap
### Keywords: aplot

### ** Examples

data(es8olatmz,package="braidrm")
rmap <- responseMap(act~conc1+conc2,es8olatmz)
formatResponseMap(rmap,xl="Olaparib",yl="TMZ",zl="Survival")
formatDifferenceMap(rmap,zcenter=-1)



