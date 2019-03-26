library(rcosmo)


### Name: coords.CMBWindow
### Title: Coordinate system from a 'CMBWindow'
### Aliases: coords.CMBWindow

### ** Examples

## Create win with sperical coords, then change it to win1 with cartesian coords
win <- CMBWindow(theta = c(0,pi/2,pi/2), phi = c(0,0,pi/2))
coords(win)
win1 <- coords(win, new.coords = "cartesian")
coords(win1)

## Change back to spherical coordinates

coords(win1) <- "spherical"
coords(win1)




