library(soilDB)


### Name: fetchRaCA
### Title: Fetch KSSL Data (EXPERIMENTAL)
### Aliases: fetchRaCA
### Keywords: utilities

### ** Examples

## Not run: 
##D   # search by series name
##D   s <- fetchRaCA(series='auburn')
##D   
##D   # search by bounding-box
##D   # s <- fetchRaCA(bbox=c(-120, 37, -122, 38))
##D   
##D   # check structure
##D   str(s, 1)
##D   
##D   # extract pedons
##D   p <- s$pedons
##D   
##D   # how many pedons
##D   length(p)
##D   
##D   # plot 
##D   par(mar=c(0,0,0,0))
##D   plot(p, name='hzn_desgn', max.depth=150)
## End(Not run)



