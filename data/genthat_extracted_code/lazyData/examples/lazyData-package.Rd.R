library(lazyData)


### Name: lazyData-package
### Title: A LazyData Facility
### Aliases: lazyData-package lazyData
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
.Search()           ## show the augmented search path

## > ls("datasets:mgcv")
##[1] "columb"       "columb.polys"



