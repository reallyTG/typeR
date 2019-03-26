library(diffobj)


### Name: Pager
### Title: Objects for Specifying Pager Settings
### Aliases: Pager PagerOff, PagerSystem, PagerSystemLess, PagerBrowser
###   PagerOff-class PagerOff PagerSystem-class PagerSystem
###   PagerSystemLess-class PagerSystemLess PagerBrowser

### ** Examples

## We `dontrun` these examples as they involve pagers that should only be run
## in interactive mode
## Not run: 
##D ## Assuming system pager is `less` and terminal supports ANSI ESC sequences
##D ## Equivalent to running `less -RFX`
##D 
##D diffChr(1:200, 180:300, pager=PagerSystemLess(flags="RFX"))
##D 
##D ## System pager is not less, but it supports ANSI escape sequences
##D 
##D diffChr(1:200, 180:300, pager=PagerSystem(ansi=TRUE))
##D 
##D ## Use a custom pager, in this case we make up a trivial one and configure it
##D ## always page (`threshold=0L`)
##D 
##D page.fun <- function(x) cat(paste0("| ", readLines(x)), sep="\n")
##D page.conf <- PagerSystem(pager=page.fun, threshold=0L)
##D diffChr(1:200, 180:300, pager=page.conf, width=getOption("width") - 2)
##D 
##D ## Set-up the custom pager as the default pager
##D 
##D options(diffobj.pager=page.conf)
##D diffChr(1:200, 180:300)
##D 
##D ## A blocking pager (this is effectively very similar to what `PagerBrowser`
##D ## does); need to block b/c otherwise temp file with diff could be deleted
##D ## before the device has a chance to read it since `browseURL` is not
##D ## blocking itself.  On OS X we need to specify the extension so the correct
##D ## program opens it (in this case `TextEdit`):
##D 
##D page.fun <- make_blocking(browseURL)
##D page.conf <- PagerSystem(pager=page.fun, file.ext="txt")
##D diffChr(1:200, 180:300, pager=page.conf)
## End(Not run)



