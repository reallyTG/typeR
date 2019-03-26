library(LongMemoryTS)


### Name: fBM
### Title: Fractional Brownian Motion / Bridge of Type I or II.
### Aliases: fBM

### ** Examples

n<-1000
d<-0.4
set.seed(1234)
motionI<-fBM(n,d, type="I")
set.seed(1234)
motionII<-fBM(n,d, type="II")
ts.plot(motionI, ylim=c(min(c(motionI,motionII)), max(motionI,motionII)))
lines(motionII, col=2)



