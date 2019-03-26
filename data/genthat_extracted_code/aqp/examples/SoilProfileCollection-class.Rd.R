library(aqp)


### Name: SoilProfileCollection-class
### Title: SoilProfileCollection Class
### Aliases: SoilProfileCollection-class SoilProfileCollection
###   $,SoilProfileCollection-method $<-,SoilProfileCollection-method
###   [,SoilProfileCollection-method
###   [,SoilProfileCollection,ANY,ANY,ANY-method
###   proj4string,SoilProfileCollection-method
###   proj4string<-,SoilProfileCollection,ANY-method
###   coordinates,SoilProfileCollection-method
###   coordinates<-,SoilProfileCollection-method names
###   names,SoilProfileCollection-method
###   length,SoilProfileCollection-method max,SoilProfileCollection-method
###   min,SoilProfileCollection-method show,SoilProfileCollection-method
###   nrow,SoilProfileCollection-method rbind.SoilProfileCollection
###   horizonNames siteNames horizonNames,SoilProfileCollection-method
###   siteNames,SoilProfileCollection-method horizonNames<- siteNames<-
###   horizonNames<-,SoilProfileCollection-method
###   siteNames<-,SoilProfileCollection-method
### Keywords: classes

### ** Examples

# concatenate SoilProfileCollection objects
## Not run: 
##D require(plyr)
##D d <- ldply(1:10, random_profile)
##D 
##D # promote to SoilProfileCollection and plot
##D depths(d) <- id ~ top + bottom
##D plot(d)
##D 
##D # split into new SoilProfileCollection objects by index
##D d.1 <- d[1, ]
##D d.2 <- d[2, ]
##D d.345 <- d[3:5, ]
##D 
##D # recombine, note that profiles are sorted according to ID
##D d.new <- rbind(d.345, d.1, d.2)
##D plot(d.new)
## End(Not run)

## Not run: 
##D # these next examples should throw an error
##D # insert a missing horizon boundary
##D data(sp1)
##D sp1$top[1] <- NA
##D depths(sp1) <- id ~ top + bottom
## End(Not run)



