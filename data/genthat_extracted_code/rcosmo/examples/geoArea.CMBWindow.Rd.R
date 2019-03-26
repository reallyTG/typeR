library(rcosmo)


### Name: geoArea.CMBWindow
### Title: Geodesic area of a 'CMBWindow'
### Aliases: geoArea.CMBWindow

### ** Examples


## A window that covers 1/8 of the unit sphere is constructed and its area is
## pi/2 = 1/8*(surface area of unit sphere)

win <- CMBWindow(theta = c(0,pi/2,pi/2), phi = c(0,0,pi/2))
geoArea(win)




