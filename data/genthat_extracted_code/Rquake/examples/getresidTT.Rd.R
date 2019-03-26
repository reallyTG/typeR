library(Rquake)


### Name: getresidTT
### Title: Travel time residuals
### Aliases: getresidTT
### Keywords: misc

### ** Examples


## Not run: 
##D 
##D #########  LF is a vector of arrival time files
##D #####  KAM is a set of locations
##D 
##D  load(LF[i])
##D     
##D     zip = LeftjustTime(twpx)
##D     EQ = KAM[[i]]$EQ
##D     ERR = KAM[[i]]$ERR
##D 
##D     LOC = list(yr=EQ$Time$yr, mo=EQ$Time$mo, dom=EQ$Time$dom, hr=EQ$Time$hr,
##D        mi=EQ$Time$mi, sec=EQ$Time$sec, jd=EQ$Time$jd, lat=EQ$lat, lon=EQ$lon,
##D        z=EQ$z, mag=NA,gap=ERR$gap,delta=ERR$distmin,rms=ERR$rms,hozerr=ERR$herr   )
##D 
##D  resids = getresidTT(zip,LOC, stas , vel)
##D 
## End(Not run)





