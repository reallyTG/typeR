library(smoothAPC)


### Name: signifAutoSmoothAPC
### Title: Smooths demographic data using automatically estimated
###   parameters and taking into account only significant period and cohort
###   effects
### Aliases: signifAutoSmoothAPC

### ** Examples

## No test: 

library(demography)
m <- log(fr.mort$rate$female[1:30, 120:139])
plot(m)
sm <- signifAutoSmoothAPC(m)
plot(sm)
plot(sm, "surface")
plot(sm, "period")
plot(sm, "cohort")

## End(No test)



