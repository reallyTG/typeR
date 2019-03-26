library(simecol)


### Name: editParms
### Title: Edit 'parms', 'init' or 'times' Slot of 'simecol' Objects
### Aliases: editParms editParms-methods editParms,simObj-method editInit
###   editInit-methods editInit,simObj-method editTimes editTimes-methods
###   editTimes,simObj-method
### Keywords: utilities

### ** Examples

## Not run: 
##D require("tcltk")
##D data(lv)        # load basic Lotka-Volterra model
##D lv <- editParms(lv)
##D plot(sim(lv))
##D 
##D data(conway)    # Conway's game of life
##D init(conway) <- matrix(0, 10, 10)
##D conway <- editInit(conway) # enter some "1"
##D sim(conway, animate = TRUE, delay = 100)
## End(Not run)



