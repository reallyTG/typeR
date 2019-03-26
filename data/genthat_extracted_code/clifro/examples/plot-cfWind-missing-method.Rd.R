library(clifro)


### Name: plot,cfWind,missing-method
### Title: Plot Clifro Wind Objects
### Aliases: plot,cfWind,missing-method plot.cfWind
###   direction_plot,cfWind,missing-method direction_plot
###   direction_plot,cfDataList,missing-method
###   direction_plot,cfDataList,numeric-method
###   speed_plot,cfWind,missing-method speed_plot
###   speed_plot,cfDataList,missing-method
###   speed_plot,cfDataList,numeric-method

### ** Examples

## Not run: 
##D # Retrieve maximum wind gust data at the Reefton Ews station from CliFlo
##D # (public data)
##D reefton_wind = cf_query(cf_user(), cf_datatype(2, 2, 1, 1), cf_station(),
##D                         start_date = "2012-01-01-00")
##D 
##D class(reefton_wind)
##D 
##D # Examples of the default plots --------------------------------------------
##D 
##D # Plot a windrose
##D plot(reefton_wind)
##D 
##D # Plot the wind direction contours
##D direction_plot(reefton_wind)
##D 
##D # Plot the wind speed time-series
##D speed_plot(reefton_wind)
##D 
##D # Examples of changing the defaults ----------------------------------------
##D 
##D # Plot black and white windroses
##D plot(reefton_wind, ggtheme = "bw", col_pal = "Greys")
##D plot(reefton_wind, ggtheme = "linedraw", col_pal = "Greys")
##D plot(reefton_wind, ggtheme = "classic", col_pal = "Greys")
##D plot(reefton_wind, ggtheme = "minimal", col_pal = "Greys")
##D 
##D # Plot the wind directions using 20 contours and the ggtheme 'classic'
##D direction_plot(reefton_wind, ggtheme = "classic", contours = 20)
##D 
##D # Enlarge all the text to 18pt
##D library(ggplot2) # for element_text() and geom_point()
##D direction_plot(reefton_wind, ggtheme = "classic", contours = 20,
##D                text = element_text(size = 18))
##D 
##D # Include the actual observations in the plots
##D direction_plot(reefton_wind) + geom_point(alpha = .2, size = 3)
##D 
##D speed_plot(reefton_wind, ggtheme = "classic", text = element_text(size = 16)) +
##D   geom_point(shape = 1, size = 3)
##D # or equivalently using base graphics:
##D plot(reefton_wind$Date, reefton_wind$Speed, type = 'o',
##D      xlab = NA, ylab = "Daily max gust (m/s)", las = 1, main = "Reefton Ews")
##D 
##D # Example of plotting a cfDataList -----------------------------------------
##D # Collect both surface wind run and hourly surface wind observations from
##D # Reefton Ews
##D reefton_list = cf_query(cf_user(), cf_datatype(2, 1, 1:2, 1),
##D                         cf_station(), "2012-01-01 00", "2012-02-01 00")
##D 
##D reefton_list
##D 
##D class(reefton_list) #cfDataList
##D 
##D # Plot the first (default) dataframe
##D plot(reefton_list) # Error - no wind directions for wind run datatypes
##D # Try speed_plot instead
##D speed_plot(reefton_list)
##D 
##D # Plot the second dataframe in the cfDataList
##D plot(reefton_list, 2)           # identical to plot(reefton_list[2])
##D speed_plot(reefton_list, 2)     # identical to speed_plot(reefton_list[2])
##D direction_plot(reefton_list, 2) # identical to direction_plot(reefton_list[2])
##D 
##D # Save the ggplot externally -----------------------------------------------
##D 
##D # Save the plot as a png to the current working directory
##D library(ggplot2) # for ggsave()
##D ggsave("my_wind_plot.png")
## End(Not run)



