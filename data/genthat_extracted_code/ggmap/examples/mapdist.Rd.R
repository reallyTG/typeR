library(ggmap)


### Name: mapdist
### Title: Compute map distances using Google
### Aliases: mapdist

### ** Examples


## Not run: 
##D  online queries draw R CMD check times
##D 
##D mapdist("waco, texas", "houston, texas")
##D 
##D from <- c("houston, texas", "dallas")
##D to <- "waco, texas"
##D mapdist(from, to)
##D mapdist(from, to, mode = "bicycling")
##D mapdist(from, to, mode = "walking")
##D 
##D from <- c("houston", "houston", "dallas")
##D to <- c("waco, texas", "san antonio", "houston")
##D mapdist(from, to)
##D 
##D 
##D # geographic coordinates are accepted as well
##D (wh <- as.numeric(geocode("the white house, dc")))
##D (lm <- as.numeric(geocode("lincoln memorial washington dc")))
##D mapdist(wh, lm, mode = "walking")
##D distQueryCheck()
##D 
## End(Not run)




