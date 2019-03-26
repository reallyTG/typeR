library(ETAS)


### Name: iran.quakes
### Title: An Iranian Earthquake Catalog
### Aliases: iran.quakes
### Keywords: datasets spatial earthquak

### ** Examples

  summary(iran.quakes)

  gregion <- list(lat = c(26, 25, 29, 38, 35), long = c(52, 59, 58, 45, 43))
  # creat an earthquake catalog
  iran.cat <- catalog(iran.quakes, study.start = "1991/01/01",
     study.end = "2011/01/01", region.poly = gregion, mag.threshold = 4.5)


  ## Not run: 
##D   plot(iran.cat)
##D   iran.fit <- etas(iran.cat)
## End(Not run)

  zagros <- list(lat = c(27, 26, 29, 29, 35, 33),
     long = c(52, 58, 58, 54, 48, 46))
  iran.cat <- catalog(iran.quakes, study.start = "1991/01/01",
     study.end = "2011/01/01", region.poly = zagros, mag.threshold = 4)



