library(oce)


### Name: undriftTime
### Title: Correct for drift in instrument clock
### Aliases: undriftTime

### ** Examples

## Not run: 
##D library(oce)
##D rbr011855 <- read.oce(
##D  "/data/archive/sleiwex/2008/moorings/m08/pt/rbr_011855/raw/pt_rbr_011855.dat")
##D d <- subset(rbr011855, time < as.POSIXct("2008-06-25 10:05:00"))
##D x <- undriftTime(d, 1)   # clock lost 1 second over whole experiment
##D summary(d)
##D summary(x)
## End(Not run)



