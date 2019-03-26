library(geomerge)


### Name: geomerge
### Title: Geospatial Data Integration
### Aliases: geomerge

### ** Examples

data(geomerge)

# 1) Simple static integration of polygon data
output <- geomerge(geoEPR,target=states,silent=TRUE)
summary (output)
## No test: 
# 2) Static integration for point, polygon, raster data
output <- geomerge(ACLED$EVENT_TYPE,AidData$project_id,geoEPR,
		   gpw,na.rm=TRUE,target=states)
summary(output)
plot(output)

# 3) Dynamic point data integration for numeric variables
output <- geomerge(ACLED$FATALITIES,AidData$commitme_1,geoEPR,
		   target=states,time=c("2011-01-01", "2011-12-31","1"),
		   t_unit='months',point.agg='sum')
summary(output)
plot(output)

# 4) Population weighted assignment
output <- geomerge(geoEPR,target=states,assignment='max(pop)',
		   population.data = gpw)
summary(output)
plot(output)
## End(No test)



