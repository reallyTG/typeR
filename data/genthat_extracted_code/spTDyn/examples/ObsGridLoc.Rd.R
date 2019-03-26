library(spTDyn)


### Name: ObsGridLoc
### Title: Combining observation and nearest grid locations and data.
### Aliases: ObsGridLoc gridTodata ObsGridData
### Keywords: utility

### ** Examples

##

library(spTimer)
data(NYdata)	
data(NYgrid)

obsLoc<-unique(cbind(NYdata$Longitude,NYdata$Latitude))
gridLoc<-unique(cbind(NYgrid$Longitude,NYgrid$Latitude))

# find closest observed and grid locations
dat<-ObsGridLoc(obsLoc, gridLoc)
head(dat)
# with plots
dat<-ObsGridLoc(obsLoc, gridLoc, plot=TRUE)
head(dat)

# convert array gridData to spTimer data format
gridData<-array(1:(10*10*31*2),dim=c(10,10,31,2)) # lon, lat, day, year
dat<-gridTodata(gridData, gridLoc)
head(dat)

# combine observed and grid data and locations
obsData<-NYdata
gridData<-array(1:(10*10*31*2),dim=c(10,10,31,2)) # lon, lat, day, year
dat<-ObsGridData(obsData, gridData, obsLoc, gridLoc)
head(dat)

# combine observed and more than one grid datasets
obsData<-NYdata
gridData1<-array(1:(10*10*31*2),dim=c(10,10,31,2)) # lon, lat, day, year
gridData2<-array(((10*10*31*2)+1):(2*(10*10*31*2)),dim=c(10,10,31,2)) # lon, lat, day, year
gridLoc1<-unique(cbind(NYgrid$Longitude,NYgrid$Latitude))
gridLoc2<-unique(cbind(NYgrid$Longitude,NYgrid$Latitude))
dat<-ObsGridData(obsData, gridData=list(gridData1,gridData2),
        obsLoc, gridLoc=list(gridLoc1, gridLoc2))
head(dat)

##



