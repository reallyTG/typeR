library(funtimes)


### Name: ARest
### Title: Estimation of Autoregressive (AR) Parameters
### Aliases: ARest
### Keywords: ts

### ** Examples

# Fix seed for reproducible simulations:
set.seed(1)

#Simulate some time series, possibly with trend:
n <- 100
Y <- arima.sim(n = n, list(order = c(2, 0, 0), ar = c(-0.7, -0.1)))
plot.ts(Y)

#Estimate the coefficients:
ARest(Y) #HVK by default
ARest(Y, ar.method = "yw") #Yule--Walker
ARest(Y, ar.method = "burg") #Burg




