library(openair)


### Name: linearRelation
### Title: Linear relations between pollutants
### Aliases: linearRelation
### Keywords: methods

### ** Examples



# monthly relationship between NOx and SO2 - note rapid fall in
# ratio at the beginning of the series
linearRelation(mydata, x = "nox", y = "so2")
# monthly relationship between NOx and SO2 - note rapid fall in
# ratio at the beginning of the series
## Not run: linearRelation(mydata, x = "nox", y = "ox")

# diurnal oxidant slope by year # clear change in magnitude
# starting 2003, but the diurnal profile has also changed: the
# morning and evening peak hours are more important, presumably
# due to change in certain vehicle types
## Not run: linearRelation(mydata, x = "nox", y = "ox", period = "hour", condition = TRUE)

# PM2.5/PM10 ratio, but only plot where monthly R2 >= 0.8
## Not run: linearRelation(mydata, x = "pm10", y = "pm25", rsq.thresh = 0.8)





