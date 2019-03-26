library(gmt)


### Name: psxy
### Title: Add Lines/Symbols to GMT Map
### Aliases: psxy

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
##D # Simple map and circles
##D pscoast("-JM12c -R158/192/-42/-8 -Di -Gdarkgreen -B10f5 -A2000 -K", "quake.ps")
##D psxy(data.frame(lon=quakes$lon, lat=quakes$lat, mag=10^quakes$mag/1e6),
##D      "-J -R -Scp -W0.5p,red -O", "quake.ps")
## End(Not run)



