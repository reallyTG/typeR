library(matconv)


### Name: makeDataMap
### Title: Make the maps for the data
### Aliases: makeDataMap

### ** Examples

	 dataMap <- makeDataMap("[", "]", "matrix")
	 dataMap("thing <- [23,2, 3.2; 7, 6, 8]")
	 # "thing <- matrix(c(23, 2, 3.2, 7, 6, 8), nrow = 2, ncol = 3)"
	 
	 dataMap <- makeDataMap(rClass = "list", matClass = "cell")
	 dataMap("otherThing <- {23,2, '3.2'; NaN, 6, 8}")
	 # "otherThing <- list(list(23, 2, '3.2'), list(NaN, 6, 8))"



