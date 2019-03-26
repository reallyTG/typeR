library(ProTrackR)


### Name: read.module
### Title: Read a ProTracker module file
### Aliases: read.module read.module,character,logical-method
###   read.module,ANY,missing-method read.module,ANY,missing-method
###   read.module,character,missing-method read.module,ANY,logical-method

### ** Examples

## Not run: 
##D 
##D ## first create an module file from example data:
##D data("mod.intro")
##D write.module(mod.intro, "intro.mod")
##D 
##D ## read the module:
##D mod  <-  read.module("intro.mod")
##D 
##D ## or create a connection yourself:
##D con  <- file("intro.mod", "rb")
##D 
##D ## note that you can also read from URL connections!
##D mod2 <- read.module(con)
##D 
##D ## don't forget to close the file:
##D close(con)
## End(Not run)



