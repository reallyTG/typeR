library(openair)


### Name: trajLevel
### Title: Trajectory level plots with conditioning
### Aliases: trajLevel

### ** Examples


# show a simple case with no pollutant i.e. just the trajectories
# let's check to see where the trajectories were coming from when
# Heathrow Airport was closed due to the Icelandic volcanic eruption
# 15--21 April 2010.
# import trajectories for London and plot
## Not run: 
##D lond <- importTraj("london", 2010)
## End(Not run)
# more examples to follow linking with concentration measurements...

# import some measurements from KC1 - London
## Not run: 
##D kc1 <- importAURN("kc1", year = 2010)
##D # now merge with trajectory data by 'date'
##D lond <- merge(lond, kc1, by = "date")
##D 
##D # trajectory plot, no smoothing - and limit lat/lon area of interest
##D # use PSCF
##D trajLevel(subset(lond, lat > 40 & lat < 70 & lon >-20 & lon <20),
##D pollutant = "pm10", statistic = "pscf")
##D 
##D # can smooth surface, suing CWT approach:
##D trajLevel(subset(lond, lat > 40 & lat < 70 & lon >-20 & lon <20),
##D pollutant = "pm2.5", statistic = "cwt",  smooth = TRUE)
##D 
##D # plot by season:
##D trajLevel(subset(lond, lat > 40 & lat < 70 & lon >-20 & lon <20), pollutant = "pm2.5",
##D statistic = "pscf", type = "season")
## End(Not run)



