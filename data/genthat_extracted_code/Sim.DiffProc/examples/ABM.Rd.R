library(Sim.DiffProc)


### Name: BM
### Title: Brownian motion, Brownian bridge, geometric Brownian motion, and
###   arithmetic Brownian motion simulators
### Aliases: ABM BB BM GBM ABM.default BB.default BM.default GBM.default
### Keywords: BM sde ts

### ** Examples


op <- par(mfrow = c(2, 2))

## Brownian motion
set.seed(1234)
X <- BM(M = 100)
plot(X,plot.type="single")
lines(as.vector(time(X)),rowMeans(X),col="red")

## Brownian bridge
set.seed(1234)
X <- BB(M =100)
plot(X,plot.type="single")
lines(as.vector(time(X)),rowMeans(X),col="red")

## Geometric Brownian motion
set.seed(1234)
X <- GBM(M = 100)
plot(X,plot.type="single")
lines(as.vector(time(X)),rowMeans(X),col="red")

## Arithmetic Brownian motion
set.seed(1234)
X <- ABM(M = 100)
plot(X,plot.type="single")
lines(as.vector(time(X)),rowMeans(X),col="red")

par(op)



