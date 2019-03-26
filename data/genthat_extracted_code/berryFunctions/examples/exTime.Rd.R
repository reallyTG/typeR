library(berryFunctions)


### Name: exTime
### Title: Time to run examples
### Aliases: exTime
### Keywords: documentation utilities

### ** Examples

exTime("plot")
exTime("yearSample", quiet=TRUE)
exTime(yearSample) # does NOT work, gives NULL and warning
exTime("yearSample", elapsed=TRUE, quiet=TRUE)
exTime("addFade", elapsed=TRUE, quiet=TRUE, run.dontrun=TRUE, run.donttest=TRUE)

## this takes quite some time if done for all functions in a package:
## Not run: 
##D times <- exTime(package="rdwd")
##D as.matrix(sort(times))
##D system2("open", tempdir()) # to view the pdf graphics created by exTime
##D 
##D # times <- exTime(package="rdwd", run.dontrun=FALSE)
## End(Not run)




