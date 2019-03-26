library(itcSegment)


### Name: itcLiDARallo
### Title: Individual Tree Crowns segmentation with LiDAR data and crown
###   diameter-height relationship
### Aliases: itcLiDARallo

### ** Examples

## Not run: 
##D data(lasData)
##D 
##D ##Creation of the look-up-table
##D 
##D lut<-matrix(6,2,data=NA)
##D lut<-data.frame(lut)
##D names(lut)<-c("H","CD")
##D 
##D lut$H<-c(2,10,15,20,25,30)
##D lut$CD<-c(0.5,1,2,3,4,5)
##D 
##D ## function takes a while to run
##D se<-itcLiDARallo(lasData$X,lasData$Y,lasData$Z,epsg=32632,lut=lut)
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



