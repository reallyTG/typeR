library(RNetLogo)


### Name: NLGetPatches
### Title: Reports the values of patch variables as a data.frame (optional
###   as a list, matrix or simple vector)
### Aliases: NLGetPatches
### Keywords: interface NLGetPatches RNetLogo

### ** Examples

## Not run: 
##D nl.path <- "C:/Program Files/NetLogo 6.0/app"
##D NLStart(nl.path)
##D # NLLoadModel(...)
##D 
##D allpatches <- NLGetPatches(c("pxcor","pycor","pcolor"))
##D str(allpatches)
##D 
##D # only a subset of patches
##D subsetpatches <- NLGetPatches(c("pxcor","pycor","pcolor"), 
##D                               "patches with [pxcor < 5]")
##D str(subsetpatches)
##D 
##D # or as a list (slightly faster):
##D colors.list <- NLGetPatches(c("pxcor","pycor","pcolor"), 
##D                         "patches with [pxcor < 5]", as.data.frame=FALSE)
##D str(colors.list)
##D 
##D # or as a list with one list element for each patch
##D # (very slow!, not recommended especially for large patchsets)
##D colors.list2 <- NLGetPatches(c("pxcor","pycor","pcolor"), 
##D                         "patches with [pxcor < 5]", as.data.frame=FALSE, 
##D                         patches.by.row=TRUE)
##D str(colors.list2)
## End(Not run)



