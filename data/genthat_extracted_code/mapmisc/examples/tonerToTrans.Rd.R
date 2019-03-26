library(mapmisc)


### Name: tonerToTrans
### Title: Convert RGB maps to semi-transparent
### Aliases: tonerToTrans rgbtToIndex

### ** Examples


## Not run: 
##D 
##D 	rgbMap = openmap(c(0,10), zoom=3, path='stamen-toner')
##D 	names(rgbMap)
##D 	plotRGB(rgbMap)
##D 	
##D 	transMap = tonerToTrans(rgbMap, col='blue')
##D 	names(transMap)
##D 	par(bg='red')
##D 	plot(transMap)
##D 
##D 	rgbMap[['stamen.tonerTrans']] = 255-rgbMap[['stamen.tonerRed']]
##D 	rgbtMap = rgbtToIndex(rgbMap)
##D 	plot(rgbtMap)
## End(Not run)



