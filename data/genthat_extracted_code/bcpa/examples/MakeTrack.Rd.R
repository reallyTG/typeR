library(bcpa)


### Name: MakeTrack
### Title: Make Track
### Aliases: MakeTrack

### ** Examples

X <- cumsum(arima.sim(n=100, model=list(ar=0.8)))
Y <- cumsum(arima.sim(n=100, model=list(ar=0.8)))
Time <- 1:100
mytrack <- MakeTrack(X,Y,Time)
plot(mytrack)



