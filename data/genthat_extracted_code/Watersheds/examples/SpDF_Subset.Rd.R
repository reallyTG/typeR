library(Watersheds)


### Name: SpDF_Subset
### Title: Subsetting spatial dataframe objects
### Aliases: SpDF_Subset
### Keywords: Subset SpDF_Subset

### ** Examples

library(Watersheds)
data(WatershedsData)

# subsetting the river Werra subbasin
id = list(gIntersects(WatershedsData$rWerra, WatershedsData$subbasin,byid=TRUE))
subbasin_rWerra = SpDF_Subset(id,WatershedsData$subbasin)
plot(subbasin_rWerra)

# subsetting the river Werra zhyd watersheds
id = list(gIntersects(WatershedsData$rWerra, WatershedsData$zhyd,byid=TRUE))
zhyd_rWerra = SpDF_Subset(id,WatershedsData$zhyd)
plot(WatershedsData$rWerra,col="blue",lwd=1,add=TRUE)
plot(zhyd_rWerra,col="green3",add=TRUE)
title("Subbasin River Weser and primary zhyd watersheds")

# subsetting the river Werra river drainage watersheds
id = list(gIntersects(subbasin_rWerra, WatershedsData$river,byid=TRUE))
river_rWerra = SpDF_Subset(id,WatershedsData$river)
plot(subbasin_rWerra)
plot(WatershedsData$rWerra,col="blue",lwd=3,add=TRUE)
plot(river_rWerra,col="blue1",add=TRUE)
title("Subbasin River Weser and drainage network")



