library(svgViewR)


### Name: svg.arrows
### Title: Write arrows to Viewer
### Aliases: svg.arrows

### ** Examples

## Not run: 
##D ## Create arrow
##D arrow <- rbind(rep(0,3), rep(1,3))
##D 
##D # Open a connection to .html file
##D svg.new(file='plot_static_arrow.html')
##D 
##D # Add arrow
##D svg.arrows(arrow)
##D 
##D # Add a coordinate axis planes around the arrow
##D svg_frame <- svg.frame(arrow)
##D 
##D # Close the file connection
##D svg.close()
## End(Not run)



