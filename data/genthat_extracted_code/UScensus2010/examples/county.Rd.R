library(UScensus2010)


### Name: county
### Title: Selects one or more counties in a given state
### Aliases: county
### Keywords: shapefiles demography county

### ** Examples

## Not run: 
##D #### look at the counties of Oregon
##D data(countyfips)
##D countyfips[countyfips$statename=="oregon",]
##D 
##D ### The county fips code is the last three characters
##D county.f<-"001"
##D county.n<-c("deschutes","crook county")
##D 
##D ## Pull out these counties
##D c1<-county(fips=county.f,state="or",level="tract")
##D c2<-county(name=county.n,state="or",level="tract")
##D 
##D ##Plot counties
##D oregon.counties<-countyfips[countyfips$statename=="oregon",]
##D col<-cbind(c("red","blue"),c("013","017"))
##D plot(c2,col=col[match(c2$county,col[,2]),1],border="gray")
##D title("Deschutes and Crook counties, OR 2000")
##D coord<-coordinates(c2)
##D text(coord[c(1,4),],oregon.counties$countyname[oregon.counties$countyname%in%county.n],cex=2)
## End(Not run)



