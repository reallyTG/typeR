library(robustarima)


### Name: predict.arima.rob
### Title: Use predict on an arima.rob Object
### Aliases: predict.arima.rob
### Keywords: ts

### ** Examples

import.rr <- arima.rob(import ~ taxes-1, data=import.dat, p=2, d=1)
import.hat <- predict(import.rr, 5, newdata=newtaxes.dat, se=TRUE)



