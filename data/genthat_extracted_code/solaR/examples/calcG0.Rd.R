library(solaR)


### Name: A2_calcG0
### Title: Irradiation and irradiance on the horizontal plane.
### Aliases: calcG0
### Keywords: utilities constructors

### ** Examples

G0dm=c(2.766,3.491,4.494,5.912,6.989,7.742,7.919,7.027,5.369,3.562,2.814,2.179)*1000;
Ta=c(10, 14.1, 15.6, 17.2, 19.3, 21.2, 28.4, 29.9, 24.3, 18.2, 17.2,
  15.2)

g0 <- calcG0(lat=37.2, modeRad='prom', dataRad=list(G0dm=G0dm, Ta=Ta))
print(g0)
xyplot(g0)

## Aguiar et al.

g0 <- calcG0(lat=37.2, modeRad='aguiar', dataRad=G0dm)
print(g0)
xyplot(g0)

##Now the G0I component of g0 is used as
##the bdI argument to calcG0 in order to
##test the intradaily correlations of fd-kt

BDi=as.zooI(g0)
BDi$Ta=25 ##Information about temperature must be contained in BDi

g02 <- calcG0(lat=37.2,
            modeRad='bdI',
            dataRad=list(lat=37.2, file=BDi),
            corr='none')

print(g02)

g03 <- calcG0(lat=37.2,
            modeRad='bdI',
            dataRad=list(lat=37.2, file=BDi),
            corr='BRL')
print(g03)

xyplot(fd~kt, data=g03, pch=19, alpha=0.3)

## Not run: 
##D ##NREL-MIDC
##D ##La Ola, Lanai
##D ##Latitude: 20.76685o North
##D ##Longitude: 156.92291o West
##D ##Elevation: 381 meters AMSL
##D ##Time Zone: -10.0
##D 
##D NRELurl <- 'http://goo.gl/fFEBN'
##D 
##D dat <- read.table(NRELurl, header=TRUE, sep=',')
##D names(dat) <- c('date', 'hour', 'G0', 'B', 'D0', 'Ta')
##D 
##D ##B is direct normal. We need direct horizontal.
##D dat$B0 <- dat$G0-dat$D0
##D 
##D ##http://www.nrel.gov/midc/la_ola_lanai/instruments.html:
##D ##The datalogger program runs using Greenwich Mean Time (GMT),
##D ##data is converted to Hawaiin Standard Time (HST) after data collection
##D idxLocal <- with(dat, as.POSIXct(paste(date, hour), format='%m/%d/%Y %H:%M', tz='HST'))
##D idx <- local2Solar(idxLocal, lon=-156.9339)
##D 
##D NRELMeteo <- zoo(dat[,c('G0', 'D0', 'B0', 'Ta')], idx)
##D 
##D lat=20.77
##D 
##D g0 <- calcG0(lat=lat, modeRad='bdI', dataRad=NRELMeteo, corr='none')
##D xyplot(g0)
##D xyplot(as.zooI(g0), superpose=TRUE)
##D 
##D g02 <- calcG0(lat=lat, modeRad='bdI', dataRad=NRELMeteo, corr='BRL')
##D xyplot(g02)
##D xyplot(as.zooI(g02), superpose=TRUE)
##D xyplot(fd~kt, data=g02, pch=19, cex=0.5, alpha=0.5)
##D 
##D g03 <- calcG0(lat=lat, modeRad='bdI', dataRad=NRELMeteo, corr='CLIMEDh')
##D xyplot(g03)
##D xyplot(as.zooI(g03), superpose=TRUE)
##D xyplot(fd~kt, data=g03, pch=19, cex=0.5, alpha=0.5)
## End(Not run)



