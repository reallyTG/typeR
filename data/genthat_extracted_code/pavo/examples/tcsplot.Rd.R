library(pavo)


### Name: tcsplot
### Title: Interactive plot of a tetrahedral colorspace
### Aliases: tcsplot tcspoints tcsvol

### ** Examples

## Not run: 
##D # For plotting
##D data(sicalis)
##D vis.sicalis <- vismodel(sicalis, visual = 'avg.uv')
##D tcs.sicalis <- colspace(vis.sicalis, space = 'tcs')
##D tcsplot(tcs.sicalis, size = 0.005)
##D rgl.postscript('testplot.pdf',fmt='pdf')
##D rgl.snapshot('testplot.png')
##D 
##D # For adding points
##D patch <- rep(c('C', 'T', 'B'), 7)
##D tcs.crown <- subset(tcs.sicalis, 'C')
##D tcs.breast <- subset(tcs.sicalis, 'B')
##D tcsplot(tcs.crown, col ='blue')
##D tcspoints(tcs.breast, col ='red')
##D 
##D # For plotting convex hull
##D tcsplot(tcs.sicalis, col = 'blue', size = 0.005)
##D tcsvol(tcs.sicalis)
## End(Not run)




