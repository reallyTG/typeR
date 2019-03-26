library(gWidgets2)


### Name: gfilter
### Title: A widget for filtering a data frame
### Aliases: .gfilter .gfilter.default [.GFilter gfilter svalue.GFilter

### ** Examples

## Not run: 
##D DF <- mtcars[, c("mpg", "cyl", "hp", "am", "wt")]
##D w <- gwindow("Example of gfilter", visible=FALSE)
##D pg <- ggroup(container=w)
##D df <- gtable(DF, container=pg)
##D a <- gfilter(df, initial.vars=data.frame(names(DF), names(DF),
##D                    c("single", "multiple", "range", "single", "range"),
##D                    stringsAsFactors=FALSE),
##D              allow.edit=TRUE,
##D              container=pg,
##D              handler=function(h,...) {
##D                visible(df) <- h$obj$get_value()
##D              }
##D              )
##D size(w) <- c(600, 600)
##D visible(w) <- TRUE
## End(Not run)



