library(gsmoothr)


### Name: tmeanC
### Title: Trimmed Mean Smoother
### Aliases: tmeanC

### ** Examples


sp <- seq(100, 1000, by=100)
ss <- seq(100,1000, by=50)
set.seed(14)
x <- rnorm(length(sp))

tmC <- tmeanC(sp, x, probeWindow=300, nProbes=5)
tmC1 <- tmeanC(sp, x, spout=sp, probeWindow=300, nProbes=5)
tmC2 <- tmeanC(sp, x, spout=ss, probeWindow=300, nProbes=5)

cbind(tmC,tmC1)

plot(sp, x, type="h", ylim=c(-2,2))
lines(sp, tmC1, col="blue")
lines(ss, tmC2, col="red")



