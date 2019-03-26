library(Imap)


### Name: imap
### Title: Interactive Mapping
### Aliases: imap ilines ipts

### ** Examples

## Not run: 
##D         if(.Platform$OS.type == "windows")
##D             windows.options(width=13, height=9)  # Set the window to be wider than high.
##D 
##D 	imap()  # On the figure, left-click two corners of an area you would like to zoom in on.
##D                 # Creating a rectangle outside the figure region will zoom out locally.
##D                 # Double left-click on the same spot to zoom back out to the original data. Right-click to stop.
##D                  
##D         imap(antarctic = TRUE)  # Reset with two left-clicks in the same spot for a more symmetrical picture.
##D 
##D 	imap(list(world.h.land, imap(world.h.land)[[1]]$ll))  # Whatever area is selected in the first use of imap()
##D                                                               # will be a different color in the second imap().
##D 
##D         col.alpha('magenta', alpha = 0.5)  # Look at the color value for magenta that has an alpha transparency value of 0.5 .
##D 
##D 	# Use this color so there is transparency where rivers and borders are the in the same location.
##D         # Also note that the land was made a lighter grey by going from grey40 to grey50.
##D         imap(list(world.h.land, world.h.lake, world.h.island, world.h.pond.in.island, world.h.borders, world.h.rivers),
##D             longrange = c(-89, -99), latrange = c(41, 50), col=c("black", "blue",  "forestgreen", "dodgerblue",
##D             "cyan", col.alpha('magenta', alpha = 0.5)), poly = c("grey50", "blue", "forestgreen", "dodgerblue", NA, NA), zoom = FALSE)
##D         
##D         # All the world's rivers with zoom turned back on (may take a while to finish).
##D         imap(list(world.h.land, world.h.lake, world.h.island, world.h.pond.in.island, world.h.borders, world.h.rivers),
##D             col=c("black", "blue", "forestgreen", "dodgerblue", "cyan", col.alpha('magenta', alpha = 0.5)), 
##D             poly = c("grey50", "blue", "forestgreen", "dodgerblue", NA, NA))
##D  
##D         test <- ilines(list(npacific, select.lines(ilines(npacific)[[1]]$ll))) # Zoom, right-click, select one or more lines, right-click.
##D 	test[[2]]$lwd <- 3                                                     # Change attributes manually and
##D         ilines(test)                                                           # keep the default keep.attr = TRUE, or
##D         test <- ilines(test, col=c("magenta", "goldenrod"), lwd = c(2,5), keep.attr = FALSE)  # set keep.attr = FALSE and use parameter options.
##D 
##D         imap(longrange = c(-84.5, -81), latrange = c(44.5, 47)) # An example of ponds on an island in the Great Lakes Region.
##D                                                                 # Use zoom = F for a static map, to which additional data may be added.
##D 
##D         # To create a file from a finished map use dev.copy2eps(), dev.copy2pdf(), or the following function for 'png'.
##D         dev.copy2png <- function(file = 'Rplot.png', factor.exp = 1, ...) {
##D 
##D         dev.copy(png, file=file, width=par()$fin[1] * factor.exp, height=par()$fin[2] * factor.exp, units="in", res=72, ...)
##D         dev.off()
##D         }
##D 
##D 	
##D         # Use with 'Maps' library	
##D         require(maps)
##D         require(mapproj)   
##D 
##D         map.to.imap <- function (map.list) {
##D           
##D              matrix(cbind(map.list[[1]], map.list[[2]]), ncol = 2)
##D         }
##D  
##D 	# Compare this map
##D 	imap(map.to.imap(map('usa')))
##D 	
##D 	# With this one
##D         windows()
##D 	imap(map.to.imap(map('usa', proj="bonne", param=45)), aspect=1)
##D 	
##D 	# Plot without axes 
##D 	imap(map.to.imap(map('usa', proj="bonne", param=45)), aspect=1, axes=FALSE)	
##D 
##D 	# Select an area to highlight and then re-zoom
##D 	ilines(list(map.to.imap(map(projection = "gnomonic")),
##D            ilines(map.to.imap(map(projection = "gnomonic")), aspect=1.5, axes=FALSE)[[1]]$ll), aspect=1.5, axes=FALSE)
## End(Not run)



