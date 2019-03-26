library(gridSVG)


### Name: viewportCreate
### Title: Recreate a viewport from imported coordinate information.
### Aliases: viewportCreate

### ** Examples
## Not run: 
##D   require(grid)
##D 
##D   grid.newpage()
##D 
##D   # Pushing a new VP to draw a rect within
##D   pushViewport(viewport(x = unit(0.3, "npc"), y = unit(0.2, "npc"),
##D                         width = unit(0.1, "npc"), height = unit(0.3, "npc"),
##D                         xscale = c(0, 20), yscale = c(0, 10),
##D                         name = "testVP"))
##D   grid.rect()
##D   grid.export("create-test.svg", exportCoords = "file")
##D 
##D   # Importing coordinate information
##D   gridSVGCoords(readCoordsJS("create-test.svg.coords.js"))
##D 
##D   # This should appear to be the same rect
##D   grid.newpage()
##D   pushViewport(viewportCreate("testVP.1"))
##D   grid.rect()
##D 
##D   # Let's see if the scales are accurate, should be:
##D   # xscale: [0, 20]
##D   # yscale: [0, 10]
##D   current.viewport()$xscale
##D   current.viewport()$yscale
## End(Not run)


