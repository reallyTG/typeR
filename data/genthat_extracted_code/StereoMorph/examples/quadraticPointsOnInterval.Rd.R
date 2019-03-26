library(StereoMorph)


### Name: quadraticPointsOnInterval
### Title: Generates points along an interval with quadratic
###   parameterization
### Aliases: quadraticPointsOnInterval

### ** Examples

## GENERATE EVENLY SPACED POINTS ON INTERVAL
q0 <- quadraticPointsOnInterval(t1=0, t2=1, n=10, a=0)

## MAKE POINTS PROGRESSIVELY FURTHER APART ALONG INTERVAL
qgt0 <- quadraticPointsOnInterval(t1=0, t2=1, n=10, a=1)

## MAKE POINTS PROGRESSIVELY CLOSER TOGETHER ALONG INTERVAL
qlt0 <- quadraticPointsOnInterval(t1=0, t2=1, n=10, a=-1)

## PLOT POINTS ON THREE SEPARATE LINES
plot(q0, rep(0, 10))
points(qgt0, rep(0.5, 10), col='green')
points(qlt0, rep(-0.5, 10), col='blue')



