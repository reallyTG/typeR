library(lognorm)


### Name: getParmsLognormForExpval
### Title: getParmsLognormForExpval
### Aliases: getParmsLognormForExpval

### ** Examples

.mean <- 1
.sigmaStar <- c(1.3,2)
(parms <- getParmsLognormForExpval(.mean, .sigmaStar))
# multiplicative standard deviation must equal the specified value
cbind(exp(parms[,"sigma"]), .sigmaStar)



