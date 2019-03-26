library(miceadds)


### Name: str_C.expand.grid
### Title: R Utilities: String Paste Combined with 'expand.grid'
### Aliases: str_C.expand.grid
### Keywords: Utility function

### ** Examples

#############################################################################
# EXAMPLE 1: Some toy examples
#############################################################################

x1 <- list( c("a","b" ), c("t", "r","v") )
str_C.expand.grid( x1 )
  ##   [1] "at" "bt" "ar" "br" "av" "bv"

x1 <- list( c("a","b" ), paste0("_", 1:4 ), c("t", "r","v") )
str_C.expand.grid( x1, indices=c(2,1,3) )
  ##    [1] "_1at" "_1bt" "_2at" "_2bt" "_3at" "_3bt" "_4at" "_4bt" "_1ar" "_1br"
  ##   [11] "_2ar" "_2br" "_3ar" "_3br" "_4ar" "_4br" "_1av" "_1bv" "_2av" "_2bv"
  ##   [21] "_3av" "_3bv" "_4av" "_4bv"

## Not run: 
##D ##***************************************************************************
##D ## The function 'str_C.expand.grid' is currently defined as
##D function( xlist, indices=NULL )
##D {
##D      xeg <- expand.grid( xlist)
##D      if ( ! is.null(indices) ){    xeg <- xeg[, indices ]}
##D      apply( xeg, 1, FUN=function(vv){ paste0( vv, collapse="") } )
##D }
##D ##***************************************************************************
## End(Not run)



