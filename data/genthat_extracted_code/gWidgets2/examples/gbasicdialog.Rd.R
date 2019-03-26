library(gWidgets2)


### Name: gbasicdialog
### Title: Constructor for modal dialog that can contain an arbitrary
###   widget
### Aliases: .gbasicdialog dispose.GBasicDialog gbasicdialog
###   visible.GBasicDialog

### ** Examples

## Not run: 
##D ## a modal dialog for editing a data frme 
##D fix_df <- function(DF, ...) {
##D   dfname <- deparse(substitute(DF))
##D   w <- gbasicdialog(..., handler=function(h,...) {
##D     assign(dfname, df[,], .GlobalEnv)
##D   })
##D   g <- ggroup(cont=w, horizontal=FALSE)
##D   glabel("Edit a data frame", cont=g)
##D   df <- gdf(DF, cont=g, expand=TRUE)
##D   size(w) <- c(400, 400)
##D   out <- visible(w)
##D }
##D 
##D m <- mtcars[1:3, 1:4]
##D fix_df(m)
## End(Not run)



