library(eplusr)


### Name: Epw
### Title: Read, and modify an EnergyPlus Weather File (EPW)
### Aliases: Epw

### ** Examples

## Not run: 
##D # read an EPW file from EnergyPlus website
##D path_base <- "https://energyplus.net/weather-download"
##D path_region <- "north_and_central_america_wmo_region_4/USA/CA"
##D path_file <- "USA_CA_San.Francisco.Intl.AP.724940_TMY3/USA_CA_San.Francisco.Intl.AP.724940_TMY3.epw"
##D path_epw <- file.path(path_base, path_region, path_file)
##D epw <- read_epw(path_epw)
##D 
##D # read an EPW file distributed with EnergyPlus
##D if (is_avail_eplus(8.8)) {
##D     epw_path <- file.path(
##D         eplus_config(8.8)$dir,
##D         "WeatherData",
##D         "USA_CA_San.Francisco.Intl.AP.724940_TMY3.epw"
##D     )
##D     epw <- read_epw(path_epw)
##D }
##D 
##D # get file path
##D epw$path()
##D 
##D # get basic info
##D epw$city
##D epw$state_province
##D epw$country
##D epw$data_source
##D epw$wmo_number
##D epw$latitude
##D epw$longitude
##D epw$time_zone
##D epw$elevation
##D epw$time_step
##D epw$start_day_of_week
##D 
##D # set basic info
##D # NOTE: Use with caution. May mess up your weather data
##D epw$city <- "Chongqing"
##D epw$city
##D 
##D epw$state_province <- "Chongqing"
##D epw$state_province
##D 
##D epw$country <- "China"
##D epw$country
##D 
##D epw$data_source <- "TMY"
##D epw$data_source
##D 
##D epw$wmo_number <- "724944"
##D epw$wmo_number
##D 
##D epw$latitude <- 20.0
##D epw$latitude
##D 
##D epw$longitude <- -120.0
##D epw$longitude
##D 
##D epw$time_zone <- 8
##D epw$time_zone
##D 
##D epw$elevation <- 100
##D epw$elevation
##D 
##D epw$time_step <- 2
##D epw$time_step
##D 
##D epw$start_day_of_week <- "Monday"
##D epw$start_day_of_week
##D 
##D # get weather data
##D str(epw$get_data())
##D 
##D # get weather data but change the year to 2018
##D # the year column is not changed by default, only the returned datetime column
##D str(epw$get_data(year = 2018)$datetime)
##D str(epw$get_data(year = 2018)$year)
##D # you can force to update the year column
##D str(epw$get_data(year = 2018, update = TRUE)$year)
##D 
##D # get weather data with units
##D str(epw$get_data(unit = TRUE))
##D # with units specified, you can easily perform unit conversion using units
##D # package
##D t_dry_bulb <- epw$get_data(unit = TRUE)$dry_bulb_temperature
##D units(t_dry_bulb) <- with(units::ud_units, "kelvin")
##D str(t_dry_bulb)
##D 
##D # change the time zone of datetime column in the returned weather data
##D attributes(epw$get_data()$datetime)
##D attributes(epw$get_data(tz = "America/Chicago")$datetime)
##D 
##D # change the weather data
##D # NOTE: This feature is experimental. There is no validation when replacing.
##D epw$set_data(epw$get_data())
##D # save the weather file
##D epw$save(file.path(tempdir(), "weather.epw"))
## End(Not run)



