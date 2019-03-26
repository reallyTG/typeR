library(svgViewR)


### Name: svg.bboxLight
### Title: Adds light(s) to Viewer
### Aliases: svg.bboxLight

### ** Examples

## Not run: 
##D # Create new Viewer
##D svg.new(mode='webgl')
##D 
##D # Add object
##D svg.cylinder(ends=rbind(c(0,0,0), c(0,10,0)), radius=1, col='green')
##D 
##D # Add lights in four corners of the bounding box
##D svg.bboxLight(x=rbind(c(1,1,1), c(-1,1,1), c(-1,-1,-1), c(1,-1,-1)))
##D 
##D # Close connection
##D svg.close()
## End(Not run)



