library(itcSegment)


### Name: itcLiDAR
### Title: Individual Tree Crowns segmentation with LiDAR data
### Aliases: itcLiDAR

### ** Examples

## Not run: 
##D data(lasData)
##D 
##D ## function takes a while to run
##D se<-itcLiDAR(lasData$X,lasData$Y,lasData$Z,epsg=32632)
##D summary(se)
##D plot(se,axes=T)
##D 
##D ## If we want to seperate the height of the trees by grayscales:
##D 
##D plot(se,col=gray((max(se$Height_m)-se$Height_m)/(max(se$Height_m)-min(se$Height_m))),axes=T)
##D 
##D ## to save the data use rgdal function called writeOGR. For more help see rgdal package.
##D 
## End(Not run)



