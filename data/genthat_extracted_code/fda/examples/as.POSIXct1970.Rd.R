library(fda)


### Name: as.POSIXct1970
### Title: as.POXIXct for number of seconds since the start of 1970.
### Aliases: as.POSIXct1970
### Keywords: manip

### ** Examples

sec <- c(0, 1, 60, 3600, 24*3600, 31*24*3600, 365*24*3600)
Sec <- as.POSIXct1970(sec)
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(sec, as.numeric(Sec))
## Don't show: 
)
## End(Don't show)



