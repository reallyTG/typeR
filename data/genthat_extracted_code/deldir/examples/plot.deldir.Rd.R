library(deldir)


### Name: plot.deldir
### Title: Plot objects produced by deldir
### Aliases: plot.deldir
### Keywords: hplot

### ** Examples

## Not run: 
##D try <- deldir(x,y,list(ndx=2,ndy=2),c(0,10,0,10))
##D plot(try)
##D #
##D deldir(x,y,list(ndx=4,ndy=4),plot=TRUE,add=TRUE,wl='te',
##D        col=c(1,1,2,3,4),num=TRUE)
##D # Plots the tesselation, but does not save the results.
##D try <- deldir(x,y,list(ndx=2,ndy=2),c(0,10,0,10),plot=TRUE,wl='tr',
##D               wp='n')
##D # Plots the triangulation, but not the points, and saves the
##D # returned structure.
## End(Not run)



