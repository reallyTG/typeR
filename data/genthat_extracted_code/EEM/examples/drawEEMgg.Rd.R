library(EEM)


### Name: drawEEMgg
### Title: Draw contour for EEM data using ggplot2
### Aliases: drawEEMgg drawEEMgg.EEM drawEEMgg.EEMweight drawEEMgg_internal

### ** Examples

## Not run: 
##D require(EEM)
##D require(ggplot2)
##D data(applejuice)
##D drawEEMgg(applejuice, 1) # draw EEM of sample no.1
##D drawEEMgg(applejuice, 1, color.palette = cm.colors) # draw EEM of sample no.31 with different color
##D drawEEMgg(applejuice, 1, nlevels = 10) # change nlevels
##D 
##D # manually define legend values
##D drawEEMgg(applejuice, 1, breaks = seq(from = 1000, to = 6000, by = 1000))
##D 
##D # can be combined with other ggplot2 commands
##D # add point to the plot
##D drawEEMgg(applejuice, 1) + geom_point(aes(x = 350, y = 500), pch = 17, cex = 10)
##D 
##D # add grid line to the plot
##D drawEEMgg(applejuice, 1) + theme(panel.grid = element_line(color = "grey"), 
##D panel.grid.major = element_line(colour = "grey"))
##D 
##D # add bg color
##D drawEEMgg(applejuice, 1, has_legend = FALSE) + geom_raster(aes(fill = value)) +
##D geom_contour(colour = "white")
##D 
## End(Not run)




