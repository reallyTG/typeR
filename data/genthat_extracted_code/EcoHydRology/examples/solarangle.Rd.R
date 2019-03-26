library(EcoHydRology)


### Name: solarangle
### Title: Solar Angle
### Aliases: solarangle

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function(lat,Jday){
# angle of solar inclination from horizontal at solar noon [rad]

#lat: latitdue [rad]
#Jday: Julian date or day of the year [day]

# solar declination [rad]
dec<-declination(Jday)

return(asin(sin(lat)*sin(dec)+cos(lat)*cos(dec)*cos(0)))
  }



