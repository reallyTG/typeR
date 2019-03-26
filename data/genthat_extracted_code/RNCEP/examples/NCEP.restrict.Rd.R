library(RNCEP)


### Name: NCEP.restrict
### Title: Temporally Filters Weather Data
### Aliases: NCEP.restrict

### ** Examples

## Not run: 
##D library(RNCEP)
##D ## First query the U component of the wind from the 850mb
##D ## pressure level
##D uwnd <- NCEP.gather(variable='uwnd', level=850,
##D     months.minmax=c(5,7), years.minmax=c(2000,2001),
##D     lat.southnorth=c(50,55), lon.westeast=c(0,5))
##D 
##D ## Then remove all observations except those made at midnight from
##D ## the first half of either May or July
##D uwnd.r <- NCEP.restrict(wx.data=uwnd, hours2remove=c(6,12,18),
##D     days2remove=seq(17,31), months2remove=6, set2na=FALSE)
##D 
##D ## Then remove the observation from 1 May 2000 at midnight ##
##D uwnd.r2 <- NCEP.restrict(wx.data=uwnd.r,
##D     other2remove="2000-05-01 00", set2na=FALSE)
## End(Not run)



