library(oce)


### Name: binmapAdp
### Title: Bin-map an ADP object
### Aliases: binmapAdp

### ** Examples


## Not run: 
##D library(oce)
##D beam <- read.oce("/data/archive/sleiwex/2008/moorings/m09/adp/rdi_2615/raw/adp_rdi_2615.000",
##D                  from=as.POSIXct("2008-06-26", tz="UTC"),
##D                  to=as.POSIXct("2008-06-26 00:10:00", tz="UTC"),
##D                  longitude=-69.73433, latitude=47.88126)
##D beam2 <- binmapAdp(beam)
##D plot(enuToOther(toEnu(beam), heading=-31.5))
##D plot(enuToOther(toEnu(beam2), heading=-31.5))
##D plot(beam, which=5:8) # backscatter amplitude
##D plot(beam2, which=5:8)
## End(Not run)




