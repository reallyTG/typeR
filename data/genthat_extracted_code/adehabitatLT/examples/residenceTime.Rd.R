library(adehabitatLT)


### Name: residenceTime
### Title: Trajectory Analysis using the Residence Time Method
### Aliases: residenceTime print.resiti plot.resiti
### Keywords: chron ts

### ** Examples

## Not run: 
##D data(albatross)
##D ltr <- albatross[1]
##D 
##D ## show the distances between successive relocations as a function
##D ## of date
##D plotltr(ltr)
##D 
##D ## focus on the first period
##D ltr <- gdltraj(ltr, as.POSIXct("2001-12-15", tz="UTC"),
##D                as.POSIXct("2003-01-10", tz="UTC"))
##D 
##D plot(ltr)
##D ## We identify places that seem to be a patch and, with locator,
##D ## we measure approximately their size.
##D ## The approximate patch radius can be set equal to 100 km as a first try
##D 
##D plotltr(ltr, "dt")
##D ## As a first try, we could set maxt equal to 15000 seconds, i.e.
##D ## approximately 4 hours
##D 
##D ## calculation of the residence time
##D res <- residenceTime(ltr, radius = 100000, maxt=4, units="hour")
##D plot(res)
##D 
##D ## There seems to be about 10 segments. Let us try the method
##D ## of Lavielle (1999, 2005) to segment this series:
##D ## First calculate again the residence time as the infolocs attribute
##D ## of the trajectory
##D res <- residenceTime(ltr, radius = 100000, maxt=4, addinfo = TRUE, units="hour")
##D res
##D 
##D ## Note that the residence time is now an attribute of the infolocs
##D ## component of res
##D 
##D 
##D ## Now, use the Lavielle method, with Kmax set to 2-3 times the
##D ## "optimal" number of segments, assessed visually according
##D ## to the recommendations of Barraquand and Benhamou (2008)
##D ## We set the minimum number of relocations in each segment to
##D ## 10 observations (given that the relocations were theoretically
##D ## taken every hour, this defines a patch as a place where the animal
##D ## stays at least 10 hours: this also defines the scale of our study)
##D 
##D ii <- lavielle(res, which="RT.100000", Kmax=20, Lmin=10)
##D 
##D ## Both the graphical method and the automated method to choose
##D ## the optimal number of segments indicate 4 segments
##D ## (see ?lavielle for a description of these methods):
##D 
##D chooseseg(ii)
##D 
##D ## We identify the 4 segments: the method of Lavielle seems to do a good
##D ## job:
##D (pa <- findpath(ii, 4))
##D 
##D ## and we plot this partition:
##D plot(pa, perani=FALSE)
##D 
##D 
##D ## Now, we could try a study at a smaller scale (patch = 50km):
##D res <- residenceTime(ltr, radius = 50000, maxt=4, addinfo = TRUE,
##D                      units="hour")
##D ii <- lavielle(res, which="RT.50000", Kmax=20, Lmin=10)
##D 
##D ## 5 segments seem a good choice:
##D chooseseg(ii)
##D 
##D ## There is more noise in the residence time, but
##D ## the partition is still pretty clear:
##D (pa <- findpath(ii, 5))
##D 
##D ## show the partition:
##D plot(pa, perani = FALSE)
##D 
##D 
##D ## Now try at a larger scale (patch size=250 km)
##D res <- residenceTime(ltr, radius = 250000, maxt=4, addinfo = TRUE,
##D                      units="hour")
##D ii <- lavielle(res, which="RT.250000", Kmax=15, Lmin=10)
##D 
##D ## 5 segments seem a good choice again:
##D chooseseg(ii)
##D 
##D ## There is more noise in the residence time, but
##D ## the partition is still pretty clear:
##D (pa <- findpath(ii, 5))
##D 
##D ## show the partition:
##D plot(pa, perani = FALSE)
##D 
## End(Not run)



