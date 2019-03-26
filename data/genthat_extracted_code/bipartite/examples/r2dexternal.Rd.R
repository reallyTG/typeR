library(bipartite)


### Name: r2dexternal
### Title: Generates null models for network analysis by considering
###   external abundances
### Aliases: r2dexternal
### Keywords: package

### ** Examples

## Not run: 
##D 	abun.lower <- c(15,5,2,7,4,8,6,0.01,6)
##D 	 set.seed(2)
##D 	(abun.higher <- rpois(27, lambda=4))
##D 	abun.higher[1] <- 0.001
##D 	sum(ext.polls)
##D 	## note: external abundances do not sum up; this is intentional!!
##D 	r2dexternal(2, Safariland, abun.higher=abun.higher, abun.lower=abun.lower)
##D 	r2dexternal(2, Safariland, abun.higher=abun.higher)
##D 
##D 	
## End(Not run)



