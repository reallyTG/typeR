library(tseriesEntropy)


### Name: Srho.ts
### Title: Entropy Measure Of Serial And Cross Dependence
### Aliases: Srho.ts
### Keywords: ts

### ** Examples

set.seed(11)
x <- arima.sim(list(order = c(1,0,0), ar = 0.8), n = 50)
S <- Srho.ts(x,lag.max=5,method="integral",bw="mlcv")

# creates a nonlinear dependence at lag 1
y <- c(runif(1),x[-50]^2*0.8-0.3)
S <- Srho.ts(x,y,lag.max=3,method="integral",bw="mlcv")



