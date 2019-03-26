library(ff)


### Name: CFUN
### Title: Collapsing functions for batch processing
### Aliases: CFUN ccbind crbind cfun cquantile csummary cmedian clength
###   csum cmean
### Keywords: manip list

### ** Examples

   X <- lapply(split(rnorm(1000), 1:10), summary)
   do.call("crbind", X)
   do.call("csummary", X)
   do.call("cmean", X)
   do.call("cfun", c(X, list(FUN=mean, FUNARGS=list(na.rm=TRUE))))
   rm(X)



