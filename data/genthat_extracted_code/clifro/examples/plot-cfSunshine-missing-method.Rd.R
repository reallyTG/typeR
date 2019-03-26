library(clifro)


### Name: plot,cfSunshine,missing-method
### Title: Plot Sunshine Hours
### Aliases: plot,cfSunshine,missing-method plot.cfSunshine

### ** Examples

## Not run: 
##D # Retrieve public hourly sunshine data for the last 7 days at Reefton Ews
##D # station
##D 
##D # Subtract 7 days from today's date to get the start date
##D last_week = paste(as.character(Sys.Date() - 7), 0)
##D 
##D reefton_sun = cf_query(cf_user(), cf_datatype(5, 1, 2), cf_station(),
##D                        start_date = last_week)
##D 
##D class(reefton_sun) # cfSunshine object
##D 
##D # Plot the temperature data using the defaults
##D plot(reefton_sun)
##D 
##D # Enlarge the text and add the observations as points
##D library(ggplot2) # for element_text() and geom_point()
##D plot(reefton_sun, ggtheme = "bw", text = element_text(size = 16)) +
##D   geom_point(size = 3, shape = 1)
##D 
##D # Save the plot as a png to the current working directory
##D library(ggplot2) # for ggsave()
##D ggsave("my_sunshine_plot.png")
## End(Not run)



