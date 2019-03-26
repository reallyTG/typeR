library(ETAS)


### Name: search.isc
### Title: Retrieving data from the ISC Bulletin
### Aliases: search.isc
### Keywords: spatial math earthquake modeling

### ** Examples


  
  # rectangular search
  ## Not run: 
##D   mydata <- search.isc(start.year=1980, start.month=1, start.day=01,
##D                    end.year=2017, end.month=11, end.day=11, 
##D                    lat.bot=33, lat.top=37,
##D                    long.left=44, long.right=48,
##D                    mag.min=3.5, mag.type='MB')  
##D   mycatalog <- catalog(mydata, study.start = "1990-01-01")
##D   plot(mycatalog)
##D   
## End(Not run)
  # circular search
  ## Not run: 
##D   mydata2 <- search.isc(start.year=2017, start.month=11, start.day=12,
##D                    end.year=2018, end.month=3, end.day=01,
##D                    searchshape="CIRC", 
##D                    lat.ctr=34.905, long.ctr=45.956,
##D                    radius=150, dist.units="km",
##D                    mag.min=3.5, mag.type='ML') 
##D   mycatalog2 <- catalog(mydata2)
##D   plot(mycatalog2)
##D   
## End(Not run)




