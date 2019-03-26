library(Imap)


### Name: select.pts, draw.polygon, inside.polygon, draw.lines, col.alpha
### Title: Select points; draw polygons; draw lines
### Aliases: select.pts draw.polygon inside.polygon draw.lines col.alpha

### ** Examples

## Not run: 
##D 
##D plot(tmp <- cbind(1:100, rnorm(100)))
##D select.pts(tmp) # Left-click three or more times, right-click to stop.
##D 
##D big.island <- select.pts(imap())  # Zoom into the Hawaiian Islands, right-click to stop, then put a polygon around the Big Island.
##D imap(list(world.h.land, big.island))  # Re-zoom into the Hawaiian Islands.  Use ilines() if a line was selected which is not a polygon.
##D 
##D imap()  # Zoom in to an area, right-click to stop.
##D draw.lines()  # Left-click two or more times, right-click to stop.
##D gdist.total(draw.lines(rainbow(12), lwd = 4, lty = 2))  # Left-click two or more times, right-click to stop.
##D draw.polygon('purple', alpha = 0.2) # Left-click three or more times, right-click to stop.
##D 
##D 
##D col.alpha('cyan', alpha = 0.3)
##D 
##D hist(rnorm(1e5), col = col.alpha('cyan', alpha = 0.3))
##D hist(rnorm(1e5, 2), col = col.alpha('magenta', alpha = 0.3), add=T)
## End(Not run)



