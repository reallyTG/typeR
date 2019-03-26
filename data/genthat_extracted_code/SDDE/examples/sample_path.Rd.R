library(SDDE)


### Name: sample_path
### Title: is a helper function that creates a vector of non-repeating
###   pathways to investigate
### Aliases: sample_path

### ** Examples

	## Draw 5 samples of 10 pathways out of 100 nodes without repeated pathways
	## Not run: 
##D 		old_path <- c();
##D 		for (i in 1:5) {
##D 		r <- sample_path(10,100, old_path);
##D 			old_path <- c(old_path, r);
##D 		}
##D 	
## End(Not run)



