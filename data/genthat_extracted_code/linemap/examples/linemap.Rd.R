library(linemap)


### Name: linemap
### Title: Line Map
### Aliases: linemap

### ** Examples

library(linemap)
data("popOcc")
# example on an extract of the gridded data
popToulouse <- popOcc[findInterval(popOcc$X, c(3600234,3659444)) == 1  &
                        findInterval(popOcc$Y, c(2290913,2348192)) == 1, ]
opar <- par(mar=c(0,0,0,0), bg = "ivory1")
linemap(x = popToulouse, var = "pop", k = 2.5, threshold = 50,
        col = "ivory1", border = "ivory4", lwd = 0.6, add = FALSE)
par(opar)

## No test: 
# example on the full dataset
library(sf)
data("occitanie")
opar <- par(mar=c(0,0,0,0), bg = "ivory2")
plot(st_geometry(occitanie), col="ivory1", border = NA)
linemap(x = popOcc, var = "pop", k = 2.5, threshold = 50,
        col = "ivory1", border = "ivory4", lwd = 0.6, add = TRUE)
par(opar)
## End(No test)



