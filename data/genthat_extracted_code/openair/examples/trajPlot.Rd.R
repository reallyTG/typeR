library(openair)


### Name: trajPlot
### Title: Trajectory line plots with conditioning
### Aliases: trajPlot

### ** Examples


# show a simple case with no pollutant i.e. just the trajectories
# let's check to see where the trajectories were coming from when
# Heathrow Airport was closed due to the Icelandic volcanic eruption
# 15--21 April 2010.
# import trajectories for London and plot
## Not run: 
##D lond <- importTraj("london", 2010)
##D # well, HYSPLIT seems to think there certainly were conditions where trajectories
##D # orginated from Iceland...
##D trajPlot(selectByDate(lond, start = "15/4/2010", end = "21/4/2010"))
## End(Not run)

# plot by day, need a column that makes a date
## Not run: 
##D lond$day <- as.Date(lond$date)
##D trajPlot(selectByDate(lond, start = "15/4/2010", end = "21/4/2010"),
##D type = "day")
## End(Not run)

# or show each day grouped by colour, with some other options set
## Not run: 
##D  trajPlot(selectByDate(lond, start = "15/4/2010", end = "21/4/2010"),
##D group = "day", col = "jet", lwd = 2, key.pos = "right", key.col = 1)
## End(Not run)
# more examples to follow linking with concentration measurements...




