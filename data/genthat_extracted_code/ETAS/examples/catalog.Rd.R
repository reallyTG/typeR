library(ETAS)


### Name: catalog
### Title: Create an Earthquake Catalog
### Aliases: catalog
### Keywords: spatial math earthquake modeling

### ** Examples

  summary(iran.quakes)

  # creating a catalog with rectangular study region
  iran.cat <- catalog(iran.quakes, time.begin="1973/01/01",
     study.start="1985/01/01", study.end="2016/01/01",
     lat.range=c(25, 42), long.range=c(42, 63),
     mag.threshold=4.5)

  print(iran.cat)
  ## Not run: 
##D   plot(iran.cat)
##D   
## End(Not run)

  # equivalently, specifying the length of the study period
  iran.cat2 <- catalog(iran.quakes, time.begin="1973/01/01",
     study.start="1985/01/01", study.length=11322,
     lat.range=c(25, 42), long.range=c(42, 63),
     mag.threshold=4.5)

  print(iran.cat2)


  # specifying a polygonal geographical region
  jpoly <- list(long=c(134.0, 137.9, 143.1, 144.9, 147.8,
      137.8, 137.4, 135.1, 130.6), lat=c(31.9, 33.0, 33.2,
      35.2, 41.3, 44.2, 40.2, 38.0, 35.4))
  # creating a catalog with polygonal study region
  japan.cat <- catalog(japan.quakes, time.begin="1966-01-01",
      study.start="1970-01-01", study.end="2010-01-01",
      region.poly=jpoly, mag.threshold=4.5)

  print(japan.cat)
  ## Not run: 
##D   plot(japan.cat)
##D   
## End(Not run)



