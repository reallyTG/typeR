library(RSEIS)


### Name: view.seis
### Title: Veiw seismic data window
### Aliases: view.seis
### Keywords: misc

### ** Examples


## Not run: 
##D 
##D 
##D ##############  method one:
##D #######  read in data base from files:
##D DB  <- scan(file="/home/lees/Site/Santiaguito/SG09/segyDB", list(fn="",
##D yr=0, jd=0, hr=0, mi=0, sec=0, dur=0))
##D 
##D 
##D ##  note: the file name includes the station SMI and the component J
##D 
##D ##########  extract names of stations and components
##D das1  <- substr(DB$fn, 58, 60)
##D comp1 <- substr(DB$fn, 62,62))
##D 
##D ###########  set up times (start and end) in julian days for selection
##D  DB$t1 <- DB$jd + DB$hr/24 + DB$mi/(24*60) + DB$sec/(24*3600)
##D DB$t2 <- DB$t1 + DB$dur/(24*3600)
##D 
##D 
##D #######   method 2:
##D 
##D DB <- makeDB("/Users/lees/Site/Santiaguito/SG09", pattern = "R", kind = 1)
##D udays <- unique(paste(DB$yr, DB$jd))
##D sdays <-  as.numeric( unlist( strsplit(udays, split=" ") ) )
##D 
##D 
##D ye <- sdays[seq(from=1, to=length(sdays), by=2)]
##D d  <- sdays[seq(from=2, to=length(sdays), by=2)]
##D o <- order(ye+d/366)
##D 
##D days <- list(yr = ye[o], jd=d[o])
##D 
##D 
##D 
##D  das1  <- DB$sta
##D   comp1 <-  DB$comp
##D 
##D #######   get unique stations from list:
##D usta <- unique(das1)
##D 
##D ###########   choose the desired components 
##D acomp <- c('I','V')
##D 
##D ####   aday refers to one of the days listed in the days structure
##D 
##D 
##D ###  days is a list of days (and associated years) that are in teh DB
##D days <- list(jd=c(365,366, 1,2,3,4), yr=c(2008, 2008, rep(2009, times=4)))
##D 
##D 
##D #### extract days from the DB list:
##D udays <- unique(paste(DB$yr, DB$jd))
##D sdays <-  as.numeric( unlist( strsplit(udays, split=" ") ) )
##D ye <- sdays[seq(from=1, to=length(sdays), by=2)]
##D d  <- sdays[seq(from=2, to=length(sdays), by=2)]
##D o <- order(ye+d/366)
##D 
##D days <- list(yr = ye[o], jd=d[o])
##D 
##D ####
##D 
##D aday <- 3
##D SAVEFILE <- 'wpix.out'
##D ihour <- 15
##D inkhour <- .5
##D 
##D ####   aday refers to one of the days listed in the days structure
##D 
##D 
##D view.seis(aday, ihour, inkhour, SAVEFILE, days, DB, usta, acomp, TZ=(-6))
##D 
##D 
##D 
## End(Not run)






