library(clifro)


### Name: plot,cfPressure,missing-method
### Title: Plot Mean Sea Level Atmospheric Pressure
### Aliases: plot,cfPressure,missing-method plot.cfPressure

### ** Examples

## Not run: 
##D # Retrieve public hourly atmospheric pressure data for the last 30 days at
##D # Reefton Ews station
##D 
##D # Subtract 30 days from today's date to get the start date
##D last_month = paste(as.character(Sys.Date() - 30), 0)
##D 
##D reefton_pressure = cf_query(cf_user(), cf_datatype(7, 1, 1), cf_station(),
##D                             start_date = last_month)
##D 
##D class(reefton_pressure) # cfPressure object
##D 
##D # Plot the atmospheric pressure data using the defaults
##D plot(reefton_pressure)
##D 
##D # Enlarge the text and add the observations as points
##D library(ggplot2) # for element_text() and geom_point()
##D plot(reefton_pressure, ggtheme = "bw", text = element_text(size = 16)) +
##D   geom_point(size = 3, shape = 1)
##D 
##D # Save the plot as a png to the current working directory
##D library(ggplot2) # for ggsave()
##D ggsave("my_pressure_plot.png")
## End(Not run)



