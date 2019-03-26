library(ecospat)


### Name: ecospat.plot.mess
### Title: Plot MESS
### Aliases: ecospat.plot.mess

### ** Examples

## Not run: 
##D x <- ecospat.testData[c(2,3,4:8)]
##D proj <- x[1:90,] #A projection dataset.
##D cal <- x[91:300,] #A calibration dataset
##D 
##D #Create a MESS object 
##D mess.object <- ecospat.mess (proj, cal, w="default")
##D 
##D #Plot MESS 
##D ecospat.plot.mess (mess.object, cex=1, pch=15)
## End(Not run)



