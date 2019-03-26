library(bfast)


### Name: bfast01
### Title: Checking for one major break in the time series
### Aliases: bfast01
### Keywords: ts

### ** Examples

library(zoo)
## define a regular time series
ndvi <- as.ts(zoo(som$NDVI.a, som$Time))

## fit variations
bf1 <- bfast01(ndvi)
bf2 <- bfast01(ndvi, test = c("BIC", "OLS-MOSUM", "supLM"), aggregate = any)
bf3 <- bfast01(ndvi, test = c("OLS-MOSUM", "supLM"), aggregate = any, bandwidth = 0.11) 

## inspect test decisions
bf1$test
bf1$breaks
bf2$test
bf2$breaks
bf3$test
bf3$breaks

## look at coefficients
coef(bf1)
coef(bf1, breaks = 0)
coef(bf1, breaks = 1) 

## zoo series with all components
plot(as.zoo(ndvi))
plot(as.zoo(bf1, breaks = 1))
plot(as.zoo(bf2))
plot(as.zoo(bf3))

## leveraged by plot method
plot(bf1, regular = TRUE)
plot(bf2)
plot(bf2, plot.type = "multiple",
     which = c("response", "trend", "season"), screens = c(1, 1, 2))
plot(bf3)




