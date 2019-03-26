library(svgViewR)


### Name: svg.lines
### Title: Add Connected Line Segments to SVG Viewer
### Aliases: svg.lines

### ** Examples

## Not run: 
##D ## Create static and animated lines
##D # Create new viewer
##D svg.new(file='svgviewr.html', animate.duration=1)
##D 
##D # Plot 3 connected lines with 3 different colors
##D svg.lines(x=rbind(c(30,-20,0), c(30,-30,0), c(40,-30,0), c(40,-35,0)), 
##D 	col=c("red", "green", "blue"), lwd=5, opacity=0.7)
##D 
##D # Plot single line that switches among 3 colors
##D svg.lines(x=rbind(c(15,0,0), c(15,-20,0)), col=c("red", "green", "blue"), lwd=3, opacity=0.7)
##D 
##D # Create a line in two animation states
##D arr <- array(c(rbind(c(15,-30,0), c(15,-50,0)), rbind(c(10,-30,0), c(10,-50,0))), dim=c(2,3,2))
##D 
##D # Plot
##D svg.lines(x=arr, col=c("red", "green"), lwd=3, opacity=0.7)
##D 
##D # Create two connected lines in 3 animation states
##D arr <- array(c(30,30,40, -40,-50,-50, 0,0,0, 40,40,50, -40,-50,-50, 
##D 	0,0,0, 50,50,60, -40,-50,-50, 0,0,0), dim=c(3,3,3))
##D 
##D # Plot
##D svg.lines(x=arr, col=c("red", "green"), lwd=5, opacity=0.7)
##D 
##D # Close connection
##D svg.close()
##D 
##D # Open svgviewr.html to visualize
## End(Not run)



