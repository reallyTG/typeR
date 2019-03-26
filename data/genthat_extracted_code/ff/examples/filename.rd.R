library(ff)


### Name: filename
### Title: Get or set filename
### Aliases: filename filename.default filename.ff_pointer filename.ffdf
###   filename<- filename<-.ff pattern pattern<- pattern.ff pattern<-.ff
###   pattern<-.ffdf
### Keywords: IO data

### ** Examples

  ## Not run: 
##D   message("Neither giving pattern nor filename gives a random filename 
##D with extension ffextension in fftempdir")
##D   x <- ff(1:12)
##D   finalizer(x)
##D   filename(x)
##D   message("Giving a pattern with just a prefix moves to a random filename 
##D beginning with the prefix in fftempdir")
##D   pattern(x) <- "myprefix_"
##D   filename(x)
##D   message("Giving a pattern with a path and prefix moves to a random filename 
##D beginning with prefix in path (use . for getwd) ")
##D   pattern(x) <- "./myprefix"
##D   filename(x)
##D   message("Giving a filename moves to exactly this filename and extension 
##D in the R-expected place) ")
##D   if (!file.exists("./myfilename.myextension")){
##D     filename(x) <- "./myfilename.myextension"
##D     filename(x)
##D   }
##D 
##D   message("NOTE that the finalizer has changed from 'delete' to 'close': 
##D now WE are responsible for deleting the file - NOT the finalizer")
##D   finalizer(x)
##D   delete(x)
##D   rm(x)
##D   
## End(Not run)



