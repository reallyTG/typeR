library(secrlinear)


### Name: edges
### Title: Interactive Edge Edit
### Aliases: showedges replot addedges deleteedges cleanskips
### Keywords: manip

### ** Examples

## Not run: 
##D inputdir <- system.file("extdata", package = "secrlinear")
##D tempmask <- read.linearmask(file = paste0(inputdir, "/silverstream.shp", spacing = 50)
##D 
##D ## show all edges
##D plot(tempmask, linecol = 'white')
##D tmp <- showedges(tempmask, add = TRUE)
##D 
##D ## select a rectangular area to zoom in
##D replot(tempmask)
##D 
##D ## click on the vertices of one or more edges to delete or add
##D tempmask <- deleteedges(tempmask)
##D tempmask <- addedges(tempmask)
##D 
## End(Not run)



