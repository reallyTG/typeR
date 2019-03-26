library(spMaps)


### Name: getEuropeReferenceTable
### Title: Get custom Europe map ('SpatialPolygonsDataFrame')
### Aliases: getEuropeReferenceTable getEuropeCountries getEuropeStates
###   spMaps getSpMaps

### ** Examples


# default map : Europe without states
europe_cty <- getSpMaps()
plot(europe_cty)

# subset on some countries
ref_table <- getEuropeReferenceTable()

italy_spain_fra <- getSpMaps(countries = c("FRA", "ITA", "ESP"))
plot(italy_spain_fra)

## Not run: 
##D italy_spain_fra_states <- getSpMaps(countries = NULL, states = c("FRA", "ITA", "ESP"))
##D plot(italy_spain_fra_states)
##D 
##D # combine countries and states
##D combine_map <- getSpMaps(countries = c("ITA", "ESP"), states = "FRA")
##D plot(combine_map)
##D 
##D # build your custom map : you can use directly data
##D # to subset the area you really want
##D europe_states <- getEuropeStates()
##D europe_countries <- getEuropeCountries()
##D 
##D # for example, have a look to GBR states map
##D summary(europe_states)
##D gbr_states_districts <- europe_states[
##D    europe_states$code %in% "GBR" &
##D    europe_states$type %in% "Administrative County",]
##D plot(gbr_states_districts)
##D 
##D # combine with another map : you just have to have the same columns...
##D # getSpMaps only return "name" and "code" column
##D custom_states <- rbind(
##D     getSpMaps(countries = NULL, states = "FRA"),
##D     gbr_states_districts[, c("name", "code"), drop = FALSE])
##D 
##D plot(custom_states)
##D 
## End(Not run)




