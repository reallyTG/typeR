library(doBy)


### Name: timeSinceEvent
### Title: Calculate "time since event" in a vector.
### Aliases: timeSinceEvent
### Keywords: utilities

### ** Examples


## Events:
yvar <- c(0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0,
          0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0)

## Plot results:
tse<- timeSinceEvent(yvar)
plot(sign.tse~tvar, data=tse, type="b")
grid()
rug(tse$tvar[tse$yvar==1], col=4, lwd=4)
points(scale(tse$run), col=tse$run, lwd=2)
lines(abs.tse + .2 ~ tvar, data=tse, type="b", col=3)

## Find times for which time since an event is at most 1:
tse$tvar[tse$abs<=1]

yvar <- c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 
0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
)
tvar <- c(207, 208, 208, 208, 209, 209, 209, 209, 210, 210, 211, 211, 
211, 212, 213, 213, 214, 214, 215, 216, 216, 216, 216, 217, 217, 
217, 218, 218, 219, 219, 219, 219, 220, 220, 221, 221, 221, 221, 
222, 222, 222)

timeSinceEvent(yvar, tvar)






