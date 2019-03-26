library(SDDE)


### Name: sample_network
### Title: compares two networks using a path analysis of total pathways
### Aliases: sample_network

### ** Examples

	## Sample 10 of the 55 pathways in Sample_1
	data(Sample_1)   
	sample_network(g1,g2, size=10)
	## Repeated sampling (5) of 10 pathways 
	## Not run: 
##D 	old_path <- c()
##D 	for (i in 1:5) {
##D        sample_paths <- sample_path(10, length(V(g1)), old_path=old_path);
##D        sample_network(g1,g2, sample_paths=sample_paths);
##D        old_path <- c(old_path,sample_paths); 
##D 	 }
##D 	
## End(Not run)



