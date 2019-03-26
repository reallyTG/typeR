library(clifro)


### Name: plot,cfScreenObs,missing-method
### Title: Plot Screen Observations
### Aliases: plot,cfScreenObs,missing-method plot.cfScreenObs

### ** Examples

## Not run: 
##D # Retrieve public temperature data from screen observations for the last week
##D # at Reefton Ews station
##D 
##D # Subtract 7 days from today's date to get the start date
##D last_week = paste(as.character(Sys.Date() - 7), 0)
##D 
##D reefton_screenobs = cf_query(cf_user(), cf_datatype(4, 1, 1), cf_station(),
##D                              start_date = last_week)
##D 
##D class(reefton_screenobs) # cfScreenObs object
##D 
##D # Plot the temperature data using the defaults
##D plot(reefton_screenobs)
##D 
##D # Enlarge the text and add the observations as points
##D library(ggplot2) # for element_text() and geom_point()
##D plot(reefton_screenobs, ggtheme = "bw", text = element_text(size = 16)) +
##D   geom_point(size = 3, shape = 1)
##D 
##D # Save the plot as a png to the current working directory
##D library(ggplot2) # for ggsave()
##D ggsave("my_screenobs_plot.png")
## End(Not run)



