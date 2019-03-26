library(RStorm)


### Name: Emit
### Title: Function to emit a 'Tuple' along the stream. The emitted data
###   'x' should be a single row of a 'data.frame'.
### Aliases: Emit
### Keywords: utilities programming

### ** Examples

	# This example can only be run within a Stream.
	# If run outside the Steam the Emit function will issue an error.
	## Not run: 
##D 		x <- data.frame(var1 = c("test", "test2"), var2 = c(2,5))
##D 		Emit(Tuple(x[1,]), ...)
##D 	
## End(Not run)



