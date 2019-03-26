library(eplusr)


### Name: read_epw
### Title: Read and Parse EnergyPlus Weather File (EPW)
### Aliases: read_epw

### ** Examples

# read an EPW file from EnergyPlus v8.8 installation folder
if (is_avail_eplus(8.8)) {
    path_epw <- file.path(
        eplus_config(8.8)$dir,
        "WeatherData",
        "USA_CA_San.Francisco.Intl.AP.724940_TMY3.epw"
   )
   epw <- read_epw(path_epw)
}

## Not run: 
##D # read an EPW file from EnergyPlus website
##D path_base <- "https://energyplus.net/weather-download"
##D path_region <- "north_and_central_america_wmo_region_4/USA/CA"
##D path_file <- "USA_CA_San.Francisco.Intl.AP.724940_TMY3/USA_CA_San.Francisco.Intl.AP.724940_TMY3.epw"
##D path_epw <- file.path(path_base, path_region, path_file)
##D epw <- read_epw(path_epw)
## End(Not run)



