library(EcoHydRology)


### Name: declination
### Title: Solar Declination
### Aliases: declination

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function(Jday){
# solar declination [rad]
#
#Jday: Julian date or day of the year [day]
#
return(0.4102*sin(pi*(Jday-80)/180))
  }



