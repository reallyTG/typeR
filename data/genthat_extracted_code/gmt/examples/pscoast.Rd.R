library(gmt)


### Name: pscoast
### Title: Draw GMT Map
### Aliases: pscoast

### ** Examples

## Not run: 
##D # Draw map and save as "map.ps" in current working directory
##D gmt(demo.par)
##D pscoast(demo.coast)
##D psxy(demo.xy)
##D pstext(demo.text, "-J -R -F+f+a+j -O -K")
##D psbar(demo.bar, ref=66)
##D psclose()
##D # See directory gmt/example for details
##D 
##D # Map in one call
##D pscoast("-JM12c -R7E/38E/29N/48N -G100 -B5", "x.ps")
## End(Not run)



