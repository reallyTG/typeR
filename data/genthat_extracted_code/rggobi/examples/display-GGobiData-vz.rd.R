library(rggobi)


### Name: display.GGobiData
### Title: Create a new display
### Aliases: display.GGobiData
### Keywords: dynamic

### ** Examples

if (interactive()) {
g <- ggobi(mtcars)
display(g[1])
display(g[1], vars=list(X=4, Y=5))
display(g[1], vars=list(X="drat", Y="hp"))
display(g[1], "Parallel Coordinates Display")
}
## Not run: 
##D display(g[1], "2D Tour")
##D display(g[1], "2x1D Tour", list(X=c(1,2,3), Y=c(4,5,6)))
##D display(g[1], "Scatterplot Matrix")
## End(Not run)



