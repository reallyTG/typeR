library(smoothAPC)


### Name: plot.smAPC
### Title: Presents demographic data as a heatmap
### Aliases: plot.smAPC

### ** Examples

## No test: 

library(demography)
m <- log(fr.mort$rate$female[1:30, 150:160])
sm <- autoSmoothAPC(m)

plot(sm)
plot(sm, "surface")
plot(sm, "cohort")
plot(sm, "period")
plot(sm, "residuals")
plot(sm, "original", main = "Original data")

## End(No test)



