library(poppr)


### Name: poppr.all
### Title: Process a list of files with poppr
### Aliases: poppr.all

### ** Examples

## Not run: 
##D # Obtain a list of fstat files from a directory.
##D x <- getfile(multi=TRUE, pattern="^.+?dat$")
##D 
##D # set the working directory to that directory.
##D setwd(x$path)
##D 
##D # run the analysis on each file.
##D poppr.all(x$files)
## End(Not run)



