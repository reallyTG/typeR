library(oce)


### Name: read.met
### Title: Read a met File
### Aliases: read.met

### ** Examples

## Not run: 
##D library(oce)
##D # Recreate data(met) and plot u(t) and v(t)
##D metFile <- download.met(id=6358, year=2003, month=9, destdir=".")
##D met <- read.met(metFile)
##D met <- oceSetData(met, "time", met[["time"]]+4*3600,
##D                  note="add 4h to local time to get UTC time")
##D plot(met, which=3:4)
## End(Not run)




