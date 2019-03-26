library(dplR)


### Name: net
### Title: Calculate NET
### Aliases: net
### Keywords: ts

### ** Examples
library(utils)
data(ca533)
ca533.rwi <- detrend(rwl = ca533, method = "ModNegExp")
ca533.net <- net(ca533.rwi)
tail(ca533.net$all)
ca533.net$average
## Not run: 
##D ## Isolate the components of NET
##D ca533.v <- net(ca533.rwi, weights=c(v=1,0))
##D ca533.g <- net(ca533.rwi, weights=c(g=1,0))
## End(Not run)



