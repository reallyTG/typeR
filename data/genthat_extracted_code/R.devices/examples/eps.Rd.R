library(R.devices)


### Name: eps
### Title: EPS graphics device
### Aliases: eps
### Keywords: device device internal

### ** Examples
## Not run: 
##D   eps("foo.eps", width=7, height=7)
##D 
##D   # is identical to
##D 
##D   postscript("foo.eps", width=7, height=7, onefile=TRUE, horizontal=FALSE)
##D 
##D   # and
##D 
##D   dev.print(eps, "foo.eps", ...)
##D 
##D   # is identical to
##D 
##D   dev.print(postscript, "foo.eps", onefile=TRUE, horizontal=FALSE, paper="special", ...)
## End(Not run)


