library(palinsol)


### Name: day2l
### Title: Converts calendar day into true solar longitude and vice-versa
### Aliases: day2l l2day date_of_perihelion

### ** Examples

## date of perihelion throughout today
orbit=c(eps=0.409214, ecc=0.01672393, varpi=4.92251)
date_of_perihelion(orbit)
## date of winter solstice)
l2day(orbit, 270*pi/180.)



