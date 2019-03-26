library(trackeR)


### Name: plot_route
### Title: Plot routes for training sessions
### Aliases: plot_route plotRoute

### ** Examples

## Not run: 
##D data('runs', package = 'trackeR')
##D plotRoute(runs, session = 4, zoom = 13)
##D plotRoute(runs, session = 4, zoom = 13, maptype = "hybrid")
##D ## multiple sessions
##D plotRoute(runs, session = c(1:5, 8:11), source = "google")
##D ## different zoom level per panel
##D plotRoute(runs, session = 6:7, source = "google", zoom = c(13, 14))
## End(Not run)



