library(diseasemapping)


### Name: getSMR-methods
### Title: Calculate the standardized mortality/morbidity ratios
### Aliases: getSMR getSMR-methods
###   getSMR,SpatialPolygonsDataFrame,ANY,ANY,ANY,ANY-method
###   getSMR,list,ANY,ANY,ANY,ANY-method
###   getSMR,data.frame,ANY,missing,missing,missing-method
###   getSMR,data.frame,ANY,data.frame,missing,missing-method
###   getSMR,data.frame,ANY,data.frame,character,missing-method
###   getSMR,data.frame,ANY,missing,character,missing-method
###   getSMR,data.frame,ANY,data.frame,character,character-method

### ** Examples

data(kentucky)

kentucky2 = getSMR(kentucky, larynxRates, larynx, 
		regionCode="County")

data.frame(kentucky2)[1:10,grep("^F|^M", names(kentucky2), invert=TRUE)]




