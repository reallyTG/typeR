library(GEOmap)


### Name: lamaz.eqarea
### Title: Lambert-Azimuthal Equal Area
### Aliases: lamaz.eqarea lamaz.inverse
### Keywords: misc

### ** Examples

data(coastmap)
#########  coastmap is a GEOmap list
DEGRAD = pi/180

phicen  = -90*DEGRAD
lamcen  = 0*DEGRAD

i = 7
j1 = coastmap$STROKES$index[i]+1
j2 = j1+ coastmap$STROKES$num[i]-1
lat = coastmap$POINTS$lat[j1:j2]*DEGRAD
lon = coastmap$POINTS$lon[j1:j2]*DEGRAD

 xy = lamaz.eqarea(phicen, lamcen,lat, lon)

plot(xy, asp=1, type='n')


 polygon(xy, col=grey(.8))

title("Antarctica")







