library(okmesonet)


### Name: okmts
### Title: Retrieve Oklahoma Mesonet climatological data
### Aliases: okmts

### ** Examples

## Not run: 
##D ## Retrieve Bessie station MTS files for 00:00 Jun 01, 1997
##D ## through 23:55 Oct 31, 1997
##D bess.mts <- okmts(begintime="1997-06-01 00:00:00",
##D  endtime="1997-10-31 23:55", station="bess")
##D 
##D ## Use POSIXct class to retrieve Medicine Park station air
##D ## temperature for 09:30 through 20:30 Aug 12, 2004
##D ## Set times, using 'America/Chicago' for Oklahoma time zone
##D medi.time <- c(as.POSIXct("2004-08-12 09:30", tz="America/Chicago"),
##D  as.POSIXct("2004-08-12 20:30", tz="America/Chicago"))
##D medi.mts <- okmts(begintime=medi.time[1], endtime=medi.time[2],
##D  station="medi", variables=c("TAIR", "RELH"))
##D 
##D ## Download all data for 2001 for station closest to
##D ## 36.575284 latitude, -99.478455 longitude, using multiple cores
##D stn.mts <- okmts(begintime="2001-01-01 00:00:00",
##D  endtime="2001-12-31 23:55:00", lat=36.575284, lon=-99.478455, mcores=T)
##D 
##D ## Retrieve Idabel station MTS data for 00:00 through 12:00 UTC (GMT)
##D ## Nov 23, 2003
##D ## Time values are returned in UTC
##D idab.mts <- okmts(begintime="2003-11-23 00:00:00",
##D  endtime="2003-11-23 12:00:00", station="idab", localtime=F)
##D 
##D ## Combine air temperature with bison movement data.
##D ## Retrieve Foraker station MTS files for 00:00 Jan 31, 2011
##D ## through 15:00 Feb 05, 2011
##D fora.mts <- okmts(begintime="2011-01-31 00:00:00",
##D  endtime="2011-02-05 15:00:00", station="fora")
##D ## Round bison timestamp down to five minute mark
##D bison$newtime <- round(bison$timestamp, "min")
##D bison$newtime$min <- as.integer(format(bison$newtime, "%M")) %/% 5 * 5
##D bison$newtime <- as.POSIXct(bison$newtime)
##D ## Add Foraker station air temperature to bison data
##D bison$TAIR <- fora.mts$TAIR[match(bison$newtime, fora.mts$TIME)]
## End(Not run)



