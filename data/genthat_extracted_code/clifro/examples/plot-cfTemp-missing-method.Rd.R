library(clifro)


### Name: plot,cfTemp,missing-method
### Title: Plot Temperature Range
### Aliases: plot,cfTemp,missing-method plot.cfTemp

### ** Examples

## Not run: 
##D # Retrieve public hourly minimum and maximum temperature data for the last
##D week at Reefton Ews station
##D 
##D # Subtract 7 days from today's date to get the start date
##D last_week = paste(as.character(Sys.Date() - 7), 0)
##D 
##D reefton_temp = cf_query(cf_user(), cf_datatype(4, 2, 2), cf_station(),
##D                         start_date = last_week)
##D 
##D class(reefton_temp) # cfTemp object
##D 
##D # Plot the temperature data using the defaults
##D plot(reefton_temp)
##D 
##D # Enlarge the text and add the observations as points
##D library(ggplot2) # for element_text() and geom_point()
##D plot(reefton_temp, ggtheme = "bw", text = element_text(size = 16)) +
##D   geom_point(size = 3, shape = 1)
##D 
##D # Save the plot as a png to the current working directory
##D library(ggplot2) # for ggsave()
##D ggsave("my_temperature_plot.png")
## End(Not run)



