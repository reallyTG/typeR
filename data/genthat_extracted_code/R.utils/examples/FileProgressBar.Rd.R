library(R.utils)


### Name: FileProgressBar
### Title: A progress bar that sets the size of a file accordingly
### Aliases: FileProgressBar
### Keywords: classes

### ** Examples

  ## Not run: 
##D   
##D # Creates a progress bar (of length 100) that displays it self as a file.
##D pb <- FileProgressBar("~/progress.simulation")
##D reset(pb)
##D while (!isDone(pb)) {
##D   x <- rnorm(3e4)
##D   increase(pb)
##D   # Emulate a slow process
##D   if (interactive()) Sys.sleep(0.1)
##D   Sys.sleep(0.01)
##D }
##D 
##D   
## End(Not run)
 


