library(oce)


### Name: as.adp
### Title: Create an ADP Object
### Aliases: as.adp

### ** Examples

data(adp)
t <- adp[["time"]]
d <- adp[["distance"]]
v <- adp[["v"]]
a <- as.adp(time=t, distance=d, v=v)
## Not run: 
##D plot(a)
## End(Not run)




