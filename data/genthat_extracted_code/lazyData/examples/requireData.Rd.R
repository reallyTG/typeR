library(lazyData)


### Name: requireData
### Title: Attach packages as required and expose non-LazyData data sets as
###   promises.
### Aliases: requireData
### Keywords: data

### ** Examples

## Don't show: 
.Search <- function() {
  srch <- search()
  srch <- paste(format(srch),
                ifelse(grepl("^datasets:", srch), "<<-- data here", ""))
  noquote(as.matrix(srch))
}
## End(Don't show)
requireData("mgcv") ## we assume has data sets but no LazyLoad
.Search()           ## show augmented search path

## > ls("datasets:mgcv")
##[1] "columb"       "columb.polys"



