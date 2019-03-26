library(remote)


### Name: plot
### Title: Plot an Eot* object
### Aliases: plot plot,EotMode,ANY-method plot,EotStack,ANY-method

### ** Examples

data(vdendool)

## claculate 2 leading modes
nh_modes <- eot(x = vdendool, y = NULL, n = 2, 
                standardised = FALSE, 
                verbose = TRUE)

## default settings 
plot(nh_modes, y = 1) # is equivalent to

## Not run: 
##D plot(nh_modes[[1]]) 
##D 
##D plot(nh_modes, y = 2) # shows variance explained by mode 2 only
##D plot(nh_modes[[2]]) # shows cumulative variance explained by modes 1 & 2
##D 
##D ## showing the loction of the mode
##D plot(nh_modes, y = 1, show.bp = TRUE)
##D 
##D ## changing parameters
##D plot(nh_modes, y = 1, show.bp = TRUE,
##D      pred.prm = "r", resp.prm = "p")
##D         
##D ## change plot arrangement
##D plot(nh_modes, y = 1, show.bp = TRUE, arrange = "long") 
##D 
##D ## plot locations of all base points
##D plot(nh_modes, locations = TRUE)
## End(Not run)




