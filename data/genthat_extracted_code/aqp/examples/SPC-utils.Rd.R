library(aqp)


### Name: SPC-utils
### Title: Getters, Setters, and Utility Methods for SoilProfileCollection
###   Objects
### Aliases: depths<- depths<-,data.frame-method
###   depths<-,SoilProfileCollection-method horizons horizons<-
###   horizons,SoilProfileCollection-method
###   horizons<-,SoilProfileCollection-method site site<-
###   site,SoilProfileCollection-method site<-,SoilProfileCollection-method
###   depth_units depth_units<- depth_units<-,SoilProfileCollection-method
###   depth_units,SoilProfileCollection-method metadata metadata<-
###   metadata,SoilProfileCollection-method
###   metadata<-,SoilProfileCollection-method diagnostic_hz diagnostic_hz<-
###   diagnostic_hz,SoilProfileCollection-method
###   diagnostic_hz<-,SoilProfileCollection-method horizonDepths
###   horizonDepths,SoilProfileCollection-method idname
###   idname,SoilProfileCollection-method profile_id
###   profile_id,SoilProfileCollection-method
### Keywords: methods

### ** Examples

data(sp1)

## init SoilProfileCollection objects from data.frame
depths(sp1) <- id ~ top + bottom

## depth units
(du <- depth_units(sp1))
depth_units(sp1) <- 'in'
depth_units(sp1) <- du

## get/set metadata on SoilProfileCollection objects
# this is a 1-row data.frame
m <- metadata(sp1)
m$sampler <- 'Dylan'
metadata(sp1) <- m

## extract horizon data from SoilProfileCollection objects as data.frame
h <- horizons(sp1)

# also replace horizon data in SoilProfileCollection objects
# original order and length must be preserved!
horizons(sp1) <- h

# get number of horizons
nrow(sp1)

	
## getting site-level data
site(sp1)

## setting site-level data
# site-level data from horizon-level data (stored in @horizons)
site(sp1) <- ~ group


# make some fake site data, and append from data.frame
# a matching ID column must be present in both @site and new data
# note that IDs should all be character class
d <- data.frame(id=profile_id(sp1), p=runif(n=length(sp1)), stringsAsFactors=FALSE)
site(sp1) <- d




