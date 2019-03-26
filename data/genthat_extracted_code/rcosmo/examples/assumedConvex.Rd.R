library(rcosmo)


### Name: assumedConvex
### Title: Check if a 'CMBWindow' is assumed convex.
### Aliases: assumedConvex

### ** Examples


win1 <- CMBWindow(theta = c(0,pi/2,pi/2), phi = c(0,0,pi/2))
assumedConvex(win1)
win2 <- assumedConvex(win1, assume.convex = TRUE)
assumedConvex(win2)
assumedConvex(win1) <- TRUE
assumedConvex(win1)




