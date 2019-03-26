library(Imap)


### Name: gdist
### Title: Geodesic distance (great circle distance) between points
### Aliases: gdist gdist.total

### ** Examples

## Not run: 
##D 
##D imap() # Zoom into an area, right-click to stop.
##D 
##D gdist.total(draw.lines(rainbow(10), lwd=4)) # Left-click two or more times, right-click to stop.
##D 
##D # The total distance of the polygon's perimeter:
##D gdist.total(draw.polygon())  # Left-click three or more times, right-click to stop.
##D 
##D # The total distance of contiguous points (those not separated by NA's).
##D gdist.total(select.pts(imap()[[1]]$ll)) # Zoom in to an area, right-click, and then select points by creating a polygon with left-clicks.
##D 
## End(Not run)



