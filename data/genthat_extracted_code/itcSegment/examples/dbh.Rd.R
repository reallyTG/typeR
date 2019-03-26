library(itcSegment)


### Name: dbh
### Title: Diameter at breast height prediction using height and crown
###   diameter
### Aliases: dbh

### ** Examples

## Not run: 
##D data(lasData)
##D 
##D ## function takes a while to run
##D 
##D #Extraction of the ITCs
##D se<-itcLiDAR(lasData$X,lasData$Y,lasData$Z,epsg=32632)
##D 
##D summary(se)
##D 
##D #Computation of the crown diameter from the crown area
##D se$CD_m<-2*sqrt(se$CA_m2/pi)
##D 
##D #DBH prediction
##D se$dbh<-NA
##D se$dbh<-dbh(se$Height_m,se$CD_m,biome=0)
##D 
##D summary(se)
##D 
## End(Not run)




