library(gWidgets)


### Name: ggraphics
### Title: Constructor for a toolkit specific plot device and a notebook to
###   wrap plots in
### Aliases: ggraphics ggraphicsnotebook
### Keywords: interface

### ** Examples

## Not run: 
##D win <- gwindow("Graphics example")
##D ggraphics(ps=6, container=win)
##D hist(rnorm(100))
##D 
##D ## This is for gWidgetsRGtk2  (along with cairoDevice) or qtutils
##D library(gWidgets)
##D options(guiToolkit="RGtk2") ## "Qt"
##D 
##D w <- gwindow("brush example", visible=FALSE)
##D g <- ggroup(container=w)
##D tbl <- gtable(mtcars, container=g, filter.FUN="manual")
##D size(tbl) <- c(300, 500)
##D gg <- ggraphics(container=g)
##D visible(w) <- TRUE
##D 
##D makePlot <- function(ind) {
##D   plot(mpg ~ wt, mtcars)
##D   if(!missing(ind) && any(ind)) 
##D     points(mpg ~ wt, mtcars[ind,], cex=2, pch=16, col="red")
##D }
##D 
##D ID <- addHandlerChanged(gg, handler=function(h,...) {
##D   x <- h$x; y <- h$y
##D 
##D   ind <- (mtcars$wt >= x[1]) & (mtcars$wt <= x[2]) &
##D          (mtcars$mpg >= y[1]) & (mtcars$mpg <= y[2])
##D 
##D   ## udpate graphic and data frame
##D   makePlot(ind) 
##D   if(any(ind))
##D     visible(tbl) <- ind
##D })
##D 
##D ## Example using a notebook. The device is raised on tab change
##D library(gWidgets)
##D options(guiToolkit="RGtk2")
##D 
##D w <- gwindow("notebook example")
##D nb <- gnotebook(container=w)
##D 
##D devs <- lapply(1:5, function(i) ggraphics(container=nb, label=as.character(i)))
##D 
##D addHandlerChanged(nb, handler=function(h,...) {
##D   ## Tricky part is svalue(h$obj) is not the new page number -- but old
##D   ## so we use the pageno component here
##D   gg <- h$obj[h$pageno]
##D   visible(gg) <- TRUE
##D })
##D 
## End(Not run)



