library(rcosmo)


### Name: window.CMBDataFrame
### Title: Get a sub window from 'CMBDataFrame'
### Aliases: window.CMBDataFrame

### ** Examples



## Example 1: Create a new CMBDataFrame with a window

cmbdf <- CMBDataFrame(nside = 64, coords = "cartesian",
                      ordering = "nested")
win <- CMBWindow(theta = c(0,pi/2,pi/2), phi = c(0,0,pi/2))
cmbdf.win <- window(cmbdf, new.window = win)
plot(cmbdf.win)
window(cmbdf.win)

## Example 2: Change the window of an existing CMBDataFrame

cmbdf <- CMBDataFrame(nside = 64, coords = "cartesian", ordering = "nested")
window(cmbdf) <- win2 <- CMBWindow(theta = c(pi/6,pi/3,pi/3, pi/6),
                                   phi = c(0,0,pi/6,pi/6))
plot(cmbdf)

## Example 3: union of windows

## Create 2 windows
win1 <- CMBWindow(theta = c(0,pi/2,pi/2), phi = c(0,0,pi/2))
win2 <- CMBWindow(theta = c(2*pi/3,3*pi/4,3*pi/4, 2*pi/3),
                            phi = c(pi/4,pi/4,pi/3,pi/3))
plot(win1)
plot(win2)

## Create CMBDataFrame with points in the union of win1 and win2

cmbdf <- CMBDataFrame(nside = 64, coords = "cartesian", ordering = "nested")
cmbdf.win <- window(cmbdf, new.window = list(win1, win2), intersect = FALSE)
plot(cmbdf.win)

## Example 4: intersection of windows

## Create 2 windows
win1 <- CMBWindow(theta = c(0,pi/2,pi/2), phi = c(0,0,pi/2))
win2 <- CMBWindow(theta = c(pi/4,pi/3,pi/3, pi/4),
                  phi = c(pi/4,pi/4,pi/3,pi/3))
plot(win1)
plot(win2)

## Create CMBDataFrame with points in the intersection of win1 and win2

cmbdf <- CMBDataFrame(nside = 64, coords = "cartesian", ordering = "nested")
cmbdf.win1 <- window(cmbdf, new.window = win1)
cmbdf.win12 <- window(cmbdf.win1, new.window = win2)
plot(cmbdf.win12)
plot(win1)
plot(win2)


## Example 5: intersection of windows with "minus" type

## Create 2 windows with "minus" type
win1 <- CMBWindow(theta = c(0,pi/2,pi/2), phi = c(0,0,pi/2),
                  set.minus =TRUE)
win2 <- CMBWindow(theta = c(pi/4,pi/3,pi/3, pi/4),
                  phi = c(pi/4,pi/4,pi/3,pi/3),
                  set.minus =TRUE)
plot(win1)
plot(win2)

## Create CMBDataFrame with points in the intersection of win1 and win2

cmbdf <- CMBDataFrame(nside = 64, coords = "cartesian", ordering = "nested")
cmbdf.win <- window(cmbdf, new.window = list(win1, win2))
plot(cmbdf.win)


## Example 6: intersection of windows with different types

##Create 2 windows, one with "minus" type

win1 <- CMBWindow(theta = c(0,pi/2,pi/2), phi = c(0,0,pi/2))
win2 <- CMBWindow(theta = c(pi/4,pi/3,pi/3, pi/4),
                  phi = c(pi/4,pi/4,pi/3,pi/3),
                  set.minus =TRUE)
plot(win1)
plot(win2)

## Create CMBDataFrame with points in the intersection of win1 and win2

cmbdf <- CMBDataFrame(nside = 64, coords = "cartesian", ordering = "nested")
cmbdf.win <- window(cmbdf, new.window = list(win1, win2), intersect = TRUE)
plot(cmbdf.win)

## Example 7: union of windows with different types

win1 <- CMBWindow(theta = c(0,pi/2,pi/2), phi = c(0,0,pi/2), set.minus =TRUE)
win2 <- CMBWindow(theta = c(pi/4,pi/3,pi/3, pi/4), phi = c(pi/4,pi/4,pi/3,pi/3))
plot(win1)
plot(win2)

## Create CMBDataFrame with points in the union of win1 and win2

cmbdf <- CMBDataFrame(nside = 64, coords = "cartesian", ordering = "nested")
cmbdf.win <- window(cmbdf, new.window = list(win1, win2), intersect = FALSE)
plot(cmbdf.win)





