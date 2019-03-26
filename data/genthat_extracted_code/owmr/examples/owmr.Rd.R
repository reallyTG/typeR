library(owmr)


### Name: owmr
### Title: owmr - An R interface to access OpenWeatherMap's API
### Aliases: owmr

### ** Examples

## Not run: 
##D    # first of all you have to set up your api key
##D    owmr_settings("your_api_key")
##D 
##D    # or store it in an environment variable called OWM_API_KEY (recommended)
##D    Sys.setenv(OWM_API_KEY = "your_api_key") # if not set globally
##D 
##D    # get current weather data for "Kassel" with temperatures in °C
##D    get_current("Kassel", units = "metric")
##D 
##D    # get 3h forcast data (7 rows)
##D    get_forecast("London", cnt = 7)
##D 
##D    # ...
## End(Not run)



