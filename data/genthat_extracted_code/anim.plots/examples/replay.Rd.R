library(anim.plots)


### Name: replay
### Title: Replay an 'anim.frames' object
### Aliases: replay replay.anim.frames plot.anim.frames

### ** Examples


myplot <- anim.plot(1:10, 1:10, speed=3)
replay(myplot, speed=5)
replay(myplot, frames=c(1,5,6,10))

myplot <- anim.plot(x<-rnorm(100), x+rnorm(100,0,3), 20, window=1:t, 
     show=FALSE, main="Regressions as sample size increases")
replay(myplot, after=abline(lm(y~x), col="red"))
 



