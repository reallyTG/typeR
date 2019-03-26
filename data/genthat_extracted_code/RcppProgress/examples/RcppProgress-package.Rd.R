library(RcppProgress)


### Name: RcppProgress-package
### Title: An interruptible progress bar with OpenMP support for c++ in R
###   packages
### Aliases: RcppProgress-package RcppProgress
### Keywords: package

### ** Examples

	# these are implemented as examples inside RcppProgress provided
	# example package: examples/RcppProgressExample
	# check the source code

	# the underlying test_test_multithreaded c++ function is multithreaded
	# , has a progress bar and is still interruptible
	## Not run: 
##D 	  RcppProgress:::test_multithreaded(nb = 300, threads = 4, recompile = TRUE)
##D 	
## End(Not run)



