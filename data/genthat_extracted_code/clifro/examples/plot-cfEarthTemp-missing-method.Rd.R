library(clifro)


### Name: plot,cfEarthTemp,missing-method
### Title: Plot Earth Temperatures
### Aliases: plot,cfEarthTemp,missing-method plot.cfEarthTemp

### ** Examples

## Not run: 
##D # Retrieve public earth temperature data for the last 30 days at Reefton Ews
##D # station, at a depth of 10cm
##D 
##D # Subtract 30 days from today's date to get the start date
##D last_month = paste(as.character(Sys.Date() - 30), 0)
##D 
##D reefton_earth = cf_query(cf_user(), cf_datatype(4, 3, 2), cf_station(),
##D                          start_date = last_month)
##D 
##D class(reefton_earth) # cfTemp object
##D 
##D # Plot the temperature data using the defaults
##D plot(reefton_earth)
##D 
##D # Enlarge the text and add the observations as points
##D library(ggplot2) # for element_text() and geom_point()
##D plot(reefton_earth, ggtheme = "bw", text = element_text(size = 16)) +
##D   geom_point(size = 3, shape = 1)
##D 
##D # Save the plot as a png to the current working directory
##D library(ggplot2) # for ggsave()
##D ggsave("my_earthTemp_plot.png")
## End(Not run)



