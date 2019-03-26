library(smoothAPC)


### Name: autoSmoothAPC
### Title: Smooths demographic data using automatically estimated
###   parameters and optionally taking into account period and cohort
###   effects
### Aliases: autoSmoothAPC

### ** Examples

## No test: 

library(demography)
m <- log(fr.mort$rate$female[1:30, 150:160])
plot(m)
sm <- autoSmoothAPC(m)
plot(sm)
plot(sm, "period")
plot(sm, "cohort")

## End(No test)



