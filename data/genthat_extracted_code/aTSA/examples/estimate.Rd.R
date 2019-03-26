library(aTSA)


### Name: estimate
### Title: Estimate an ARIMA Model
### Aliases: estimate

### ** Examples

estimate(lh, p = 1) # AR(1) process
estimate(lh, p = 1, q = 1) # ARMA(1,1) process
estimate(lh, p = c(1,3)) # sparse AR((1,3)) process

# seasonal ARIMA(0,1,1)x(0,1,1)(12) model
estimate(USAccDeaths, p = 1, d = 1, PDQ = c(0,1,1))



