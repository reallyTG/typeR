library(VGAMextra)


### Name: WN.InitARMA
### Title: Estimated White Noise (WN) from the autoregressive
###   moving-average model of order-(p, q) [ARMA(p, q)].
### Aliases: WN.InitARMA

### ** Examples


# Generating some data -> an MA(3) 
set.seed(1004)
mydata <- arima.sim( n = 200, list(ma = c(0.3, 0.56 , 0.11)) )

# Computing initial values to be passed to MAXff()
WN.InitARMA(tsData = data.frame(y = mydata), 
            order = c(0, 0, 3), 
            moreOrder = 1)

# Returning initial values and white noise.
initMA <- WN.InitARMA(tsData = data.frame(y = mydata), 
                      order = c(0, 0, 3), 
                      moreOrder = 1, 
                      whiteN = TRUE) 
                      
# Initial values passed to MAXff()
initMA$Coeff

# Estimated white noise
head(initMA$WhiteNoise)
                      



