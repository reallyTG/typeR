library(gridGraphics)


### Name: grid.echo
### Title: Echo 'graphics' output using 'grid' graphics
### Aliases: grid.echo
### Keywords: dplot

### ** Examples

## Not run: 
##D # Echo existing drawing
##D plot(1)
##D grid.echo()
##D 
##D # Echo result of call to a plotting function
##D plotfun <- function() plot(1:10)
##D grid.echo(plotfun)
##D 
##D # Echo result of a plotting function (anonymous) into current viewport
##D grid.newpage()
##D pushViewport(viewport(x=0, width=.5, just="left"))
##D grid.rect(gp=gpar(col=NA, fill="grey"))
##D grid.echo(function() plot(1:10), newpage=FALSE)
## End(Not run)



