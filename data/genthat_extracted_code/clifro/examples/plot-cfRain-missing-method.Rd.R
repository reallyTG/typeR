library(clifro)


### Name: plot,cfRain,missing-method
### Title: Plot Rain Time series
### Aliases: plot,cfRain,missing-method plot.cfRain

### ** Examples

## Not run: 
##D # Retrieve public rain data for a month from CliFlo (at Reefton Ews station)
##D reefton_rain = cf_query(cf_user(), cf_datatype(3, 1, 1), cf_station(),
##D                         start_date = "2012-08-01-00",
##D                         end_date = "2012-09-01-00")
##D 
##D class(reefton_rain) # cfRain object
##D 
##D # Plot the rain data using the defaults
##D plot(reefton_rain)
##D 
##D # Change the ggtheme and enlarge the text
##D library(ggplot2) # for element_text()
##D plot(reefton_rain, ggtheme = "bw", text = element_text(size = 16))
##D 
##D # Save the plot as a png to the current working directory
##D library(ggplot2) # for ggsave()
##D ggsave("my_rain_plot.png")
## End(Not run)



