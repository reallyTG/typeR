library(sem)


### Name: Klein
### Title: Klein's Data on the U. S. Economy
### Aliases: Klein
### Keywords: datasets

### ** Examples

Klein$P.lag <- c(NA, Klein$P[-22])
Klein$X.lag <- c(NA, Klein$X[-22])

summary(tsls(C ~ P + P.lag + I(Wp + Wg), 
    instruments=~1 + G + T + Wg + I(Year - 1931) + K.lag + P.lag + X.lag,
    data=Klein))
    
summary(tsls(I ~ P + P.lag + K.lag,
    instruments=~1 + G + T + Wg + I(Year - 1931) + K.lag + P.lag + X.lag,
    data=Klein))
    
summary(tsls(Wp ~ X + X.lag + I(Year - 1931),
    instruments=~1 + G + T + Wg + I(Year - 1931) + K.lag + P.lag + X.lag,
    data=Klein))



