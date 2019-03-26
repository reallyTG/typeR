library(lfstat)


### Name: setlfunit
### Title: Define the unit to use in lf-plots
### Aliases: setlfunit

### ** Examples

data(ngaruroro)
#Default: no unit
bfplot(ngaruroro, year = 1991)

#The plot does not change, just the y-label does!
setlfunit("m^3/s")
bfplot(ngaruroro,year = 1991)

#Some possible labels:
setlfunit("m^3/s")
setlfunit("m^{3}*s^{-1}")
setlfunit("scriptscriptstyle(frac(m^3,s))")
setlfunit("l/s")
setlfunit("l*s^{-1}")
setlfunit("scriptscriptstyle(frac(l,s))")
setlfunit("m^3/s/km^2")
setlfunit("m^3*s^{-1}*km^{-2}")
setlfunit("scriptscriptstyle(frac(m^3,s%.%km^2))")
setlfunit("l/s/km^2")
setlfunit("l*s^{-1}*km^{-2}")
setlfunit("scriptscriptstyle(frac(l,s%.%km^2))")



