library(colourlovers)


### Name: plot
### Title: Plot a COLOURlovers object
### Aliases: clpng clpie plot.clcolor plot.clcolors plot.clpalette
###   plot.clpalettes plot.clpattern plot.clpatterns

### ** Examples

e <- function(e) NULL # function for tryCatch to fail in examples

# plot a color clpng
co <- tryCatch( clcolor(rgb(0,0,1)), error = e)
if(!is.null(co)) plot(co)

# plot a pattern clpng
p <- tryCatch( clpattern('1451'), error = e)
if(!is.null(p)) plot(p)
if(!is.null(p)) clpng(p)

# plot colors from a palette
p <- tryCatch( clpalette('113451'), error = e)
if(!is.null(p)) plot(p, type='pie')
if(!is.null(p)) clpie(p)


## Not run: 
##D # plot multiple palettes (interactively)
##D p <- tryCatch( clpalettes('top'), error = e)
##D if(!is.null(p)) plot(p) # PNG images
##D if(!is.null(p)) plot(p, type='pie') # pie chart swatches
## End(Not run)



