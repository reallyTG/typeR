library(smoothAPC)


### Name: plot3d.smAPC
### Title: Presents demographic data as a 3D surface
### Aliases: plot3d.smAPC

### ** Examples

## No test: 

library(demography)
m <- log(fr.mort$rate$female[1:30, 150:160])
sm <- autoSmoothAPC(m)

plot3d(sm)
plot3d(sm, "surface", color.palette = "special")
plot3d(sm, "cohort")
plot3d(sm, "period")
plot3d(sm, "residuals")
plot3d(sm, "original", color.palette = rainbow)

## End(No test)



