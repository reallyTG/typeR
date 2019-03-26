library(gWidgets)


### Name: glayout
### Title: A container for aligning widgets in a table
### Aliases: glayout
### Keywords: interface

### ** Examples

## Not run: 
##D   ## show part of mtcars dataframe in a layout
##D   w <- gwindow("glayout example")
##D   tbl <- glayout(container = w)
##D   tbl[1,1] <- "a label"
##D   ## need container argument in gWidgetstcltk, gWidgetsRwxwidgets
##D   ## so we always use it.
##D   tbl[1,2, expand = TRUE] <- gedit("edit here", container=tbl)
##D   tbl[2,1, anchor = c(-1,-1)] <- glabel("ll", container = tbl)
##D 
##D   ## extraction:
##D   tbl[1,1] # glabel instance
##D   tbl[1,2] # gedit instance, ...
## End(Not run)



