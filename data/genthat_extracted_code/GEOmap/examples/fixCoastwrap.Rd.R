library(GEOmap)


### Name: fixCoastwrap
### Title: Correct the Wrapping problem
### Aliases: fixCoastwrap
### Keywords: misc

### ** Examples

data(coastmap)
SEL = which(coastmap$STROKES$nam=="AFROASIA")

A = ExcludeGEOmap(coastmap, SEL, INOUT="in")

plot(A$POINTS$lon, A$POINTS$lat, type='n')

points(A$POINTS$lon, A$POINTS$lat, pch='.')

######  note that the map wraps around.

B = fixCoastwrap(list(x=A$POINTS$lon, y=A$POINTS$lat), 100)
 which(is.na(B$x))



lines(B)


polygon(B, col=rgb(.8,1, .8))






