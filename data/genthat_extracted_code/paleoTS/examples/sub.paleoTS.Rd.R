library(paleoTS)


### Name: sub.paleoTS
### Title: Subset an evolutionary time series
### Aliases: sub.paleoTS
### Keywords: models ts

### ** Examples

 y <- sim.GRW(ns=100, ms=0, vs=0.3)
 plot(y, col='grey')
 ys1<- sub.paleoTS(y, ok=y$mm > mean(y$mm))  # subsetting with logical ok
 ys2<- sub.paleoTS(y, ok=1:10)				 # subsetting with numeric ok
 ys3<- sub.paleoTS(y, k=0.1)				 # subsetting random 10%
 plot(ys1, add=TRUE, col="red")
 plot(ys2, add=TRUE, col="blue")
 plot(ys3, add=TRUE, col="green")



