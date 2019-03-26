library(Rquake)


### Name: viewCHAC
### Title: View Continuous Data
### Aliases: viewCHAC
### Keywords: misc

### ** Examples

## Not run: 
##D 
##D ##########  set up data base:
##D fpath = "/home/lees/Site/CHAC/DATA"
##D fpat = "201111"
##D DBnov = makeDB(fpath, fpat, kind=2, Iendian=1, BIGLONG=FALSE)
##D ###   get information:
##D IDB = infoDB(DBnov)
##D 
##D #####  select stations and components:
##D gstas = IDB$usta[-which(IDB$usta=="CHAC5")]
##D gcomps = IDB$ucomp[1:3]
##D 
##D ####  extra buttons
##D buts = c("YPIX", "SPEC", "SGRAM", "WLET")
##D  fsta = "/home/lees/Site/CHAC/staLLZ.txt"
##D stas = scan(file=fsta,what=list(name="", lat=0, lon=0, z=0))
##D stas$z = stas$z/1000
##D 
##D ###  set schedule
##D sched  =seq(from=325, to=335, by=1/24)
##D 
##D ##########  open 2 windows
##D X11()
##D X11()
##D 
##D ###  set main window to dev 2
##D dev.set(2)
##D 
##D ###  set pre-filter (needs to be ON=TRUE to work
##D 
##D preFILT = list(ON=TRUE, fl=1/2 , fh=8, type="BP", proto="BU")
##D 
##D viewCHAC( DBnov , gstas, gcomps , sched, stas, buts =buts,
##D        preFILT = preFILT,kind = 2, Iendian = 1, BIGLONG = FALSE )
##D 
##D 
## End(Not run)




