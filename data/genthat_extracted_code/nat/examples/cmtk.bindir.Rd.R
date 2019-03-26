library(nat)


### Name: cmtk.bindir
### Title: Return path to directory containing CMTK binaries
### Aliases: cmtk.bindir cmtk

### ** Examples

message(ifelse(is.null(d<-cmtk.bindir()), "CMTK not found!",
               paste("CMTK is at:",d)))
## Not run: 
##D # set options('nat.cmtk.bindir') according to where cmtk was found
##D op=options(nat.cmtk.bindir=NULL)
##D cmtk.bindir(set=TRUE)
##D options(op)
## End(Not run)



