library(highlight)


### Name: HighlightWeaveLatex
### Title: Sweave driver performing syntax highlighting
### Aliases: HighlightWeaveLatex

### ** Examples

## Not run: 
##D # using the driver on the grid vignette
##D require( grid )
##D v <- vignette( "grid", package = "grid" )$file
##D file.copy( v, "grid.Snw" )
##D Sweave( "grid.Snw", driver= HighlightWeaveLatex() )
## End(Not run)



