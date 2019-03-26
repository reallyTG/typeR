library(adehabitatLT)


### Name: sett0
### Title: Round the Timing of Collection of Relocations to Obtain Regular
###   Trajectory
### Aliases: sett0
### Keywords: programming

### ** Examples

## Not run: 
##D #########################################################################
##D ##
##D ##
##D ## Transform a GPS monitoring on 4 ibex into a regular trajectory
##D ##
##D 
##D data(ibexraw)
##D is.regular(ibexraw)
##D 
##D ## the data are not regular: see the distribution of dt (in hours)
##D ## according to the date
##D 
##D plotltr(ibexraw, "dt/3600")
##D 
##D ## The relocations have been collected every 4 hours, and there are some
##D ## missing data
##D 
##D ## The reference date: the hour should be exact (i.e. minutes=0):
##D refda <- strptime("00:00", "%H:%M", tz="Europe/Paris")
##D refda
##D 
##D ## Set the missing values
##D ib2 <- setNA(ibexraw, refda, 4, units = "hour") 
##D 
##D ## now, look at dt for the bursts:
##D plotltr(ib2, "dt")
##D 
##D ## dt is nearly regular: round the date:
##D 
##D ib3 <- sett0(ib2, refda, 4, units = "hour") 
##D 
##D plotltr(ib3, "dt")
##D is.regular(ib3)
##D 
##D ## ib3 is now regular
## End(Not run)



