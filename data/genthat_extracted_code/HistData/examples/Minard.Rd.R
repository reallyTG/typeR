library(HistData)


### Name: Minard
### Title: Data from Minard's famous graphic map of Napoleon's march on
###   Moscow
### Aliases: Minard Minard.cities Minard.troops Minard.temp
### Keywords: datasets spatial

### ** Examples

data(Minard.troops)
data(Minard.cities)
data(Minard.temp)

## Not run: 
##D #' ## Load required packages
##D require(ggplot2)
##D require(scales)
##D require(gridExtra)
##D 
##D #' ## plot path of troops, and another layer for city names
##D  plot_troops <- ggplot(Minard.troops, aes(long, lat)) +
##D 		geom_path(aes(size = survivors, colour = direction, group = group),
##D                  lineend = "round", linejoin = "round")
##D  plot_cities <- geom_text(aes(label = city), size = 4, data = Minard.cities)
##D  
##D #' ## Combine these, and add scale information, labels, etc.
##D #' Set the x-axis limits for longitude explicitly, to coincide with those for temperature
##D 
##D breaks <- c(1, 2, 3) * 10^5 
##D plot_minard <- plot_troops + plot_cities +
##D  	scale_size("Survivors", range = c(1, 10), 
##D  	            breaks = breaks, labels = scales::comma(breaks)) +
##D   scale_color_manual("Direction", 
##D                      values = c("grey50", "red"), 
##D                      labels=c("Advance", "Retreat")) +
##D   coord_cartesian(xlim = c(24, 38)) +
##D   xlab(NULL) + 
##D   ylab("Latitude") + 
##D   ggtitle("Napoleon's March on Moscow") +
##D   theme_bw() +
##D   theme(legend.position=c(.8, .2), legend.box="horizontal")
##D  
##D #' ## plot temperature vs. longitude, with labels for dates
##D plot_temp <- ggplot(Minard.temp, aes(long, temp)) +
##D 	geom_path(color="grey", size=1.5) +
##D 	geom_point(size=2) +
##D 	geom_text(aes(label=date)) +
##D 	xlab("Longitude") + ylab("Temperature") +
##D 	coord_cartesian(xlim = c(24, 38)) + 
##D 	theme_bw()
##D 	
##D 
##D #' The plot works best if we  re-scale the plot window to an aspect ratio of ~ 2 x 1
##D # windows(width=10, height=5)
##D 
##D #' Combine the two plots into one
##D grid.arrange(plot_minard, plot_temp, nrow=2, heights=c(3,1))
##D 
## End(Not run)



