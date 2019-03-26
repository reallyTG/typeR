library(Watersheds)


### Name: WatershedsData
### Title: A dataset of the ECRINS database for the river Weser basin,
###   Germany.
### Aliases: WatershedsData
### Keywords: datasets

### ** Examples

data(WatershedsData)

	# plotting river Weser basin
	plot(WatershedsData$ctry)
	plot(WatershedsData$basin, col="green4", add=TRUE)
	title("River Weser basin, Germany")

	# plotting river Weser basin
	plot(WatershedsData$ctry)
	plot(WatershedsData$basin, col="green4", add=TRUE)
	title("River Weser basin, Germany")

	# plotting subbasins river Weser basin
	plot(WatershedsData$basin)
	plot(WatershedsData$subbasin, col="green3",add=TRUE)
	plot(WatershedsData$rWeser,col="blue",lwd=2,add=TRUE)
	plot(WatershedsData$rAller,col="blue",lwd=1,add=TRUE)
	plot(WatershedsData$rDiemel,col="blue",lwd=1,add=TRUE)
	plot(WatershedsData$rFulda,col="blue",lwd=1,add=TRUE)
	plot(WatershedsData$rHunte,col="blue",lwd=1,add=TRUE)
	plot(WatershedsData$rWerra,col="blue",lwd=1,add=TRUE)
	plot(WatershedsData$rWiumme,col="blue",lwd=1,add=TRUE)
	title("Subbasins River Weser")

	# plotting primary zhyd watersheds and drainage network inside river Werra subbasin
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



