library(smoothAPC)


### Name: smoothAPC
### Title: Smooths demographic data optionally taking into account period
###   and cohort effects
### Aliases: smoothAPC

### ** Examples

## No test: 

library(demography)
m <- log(fr.mort$rate$female[1:30, 150:160])
sm <- smoothAPC(m, lambdaaa = 0.2, lambdayy = 0.1, lambdaay = 0.4, effects = FALSE)
plot(sm, "original")
plot(sm)

## End(No test)



