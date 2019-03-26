library(sinew)


### Name: untangle
### Title: Split an R script by functions
### Aliases: untangle

### ** Examples

## Not run: 
##D txt <- "#some comment
##D #' @import utils
##D yy <- function(a=4){
##D  utils::head(runif(10),a)
##D  # a comment
##D }
##D 
##D v <- 20
##D 
##D #another comment
##D #' @import utils
##D zz <- function(v=10,a=3){
##D  utils::head(runif(v),pmin(a,v))
##D }
##D 
##D zz(v)
##D 
##D "
##D untangle(txt,dir.out = 'test')
##D 
## End(Not run)



