library(arfima)


### Name: tacvfARFIMA
### Title: The theoretical autocovariance function of a long memory
###   process.
### Aliases: tacvfARFIMA
### Keywords: ts

### ** Examples


t1 <- tacvfARFIMA(phi = c(0.2, 0.1), theta = 0.4, dfrac = 0.3, maxlag = 30)
t2 <- tacvfARFIMA(phi = c(0.2, 0.1), theta = 0.4, H = 0.8, maxlag = 30)
t3 <- tacvfARFIMA(phi = c(0.2, 0.1), theta = 0.4, alpha = 0.4, maxlag = 30)
plot(t1, type = "o", col = "blue", pch = 20)
lines(t2, type = "o", col = "red", pch = 20)
lines(t3, type = "o", col = "purple", pch = 20)  #they decay at about the same rate





