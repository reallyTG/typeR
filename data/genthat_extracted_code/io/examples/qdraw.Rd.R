library(io)


### Name: qdraw
### Title: Draw plot
### Aliases: qdraw

### ** Examples

## Not run: 
##D # Set device to jpeg (remember to update file extensions for printed plots)
##D options(plot.device=jpeg)
##D qdraw(plot(1:10), "plot.jpeg")
##D 
##D # Enable automatic plot format inference
##D options(plot.device=NULL)
##D 
##D # Plot directly to file (format is inferred from filename extension)
##D qdraw(plot(1:10), "plot.pdf")
##D 
##D # Plot to screen, then print to file (display will not be closed)
##D qdraw(plot(1:10), "plot.png", device=NA)
##D 
##D # If an error occurs, be sure to clear the current plot
##D dev.off()
##D # or clear all plots
##D graphics.off()
## End(Not run)




