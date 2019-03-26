library(spData)


### Name: nydata
### Title: New York leukemia data
### Aliases: nydata NY_data listw_NY
### Keywords: datasets foreign spdep

### ** Examples

## NY leukemia
## Not run: 
##D library(foreign)
##D nydata <- read.dbf(system.file("misc/nydata.dbf", package="spData")[1])
##D library(sp)
##D coordinates(nydata) <- c("X", "Y")
##D plot(nydata)
##D 
##D nyadjmat <- as.matrix(read.dbf(system.file("misc/nyadjwts.dbf",
##D                                            package="spData")[1])[-1])
##D ID <- as.character(names(read.dbf(system.file("misc/nyadjwts.dbf",
##D                                               package="spData")[1]))[-1])
##D identical(substring(ID, 2, 10), substring(as.character(nydata$AREAKEY), 2, 10))
##D 
##D library(spdep)
##D nyadjlw <- mat2listw(nyadjmat, as.character(nydata$AREAKEY))
##D listw_NY <- nb2listw(nyadjlw$neighbours, style="B")
## End(Not run)



