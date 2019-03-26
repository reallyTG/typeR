library(DMRMark)


### Name: boundFinder
### Title: Find a pair of reasonable distances of group means for hyper-
###   and hypomethylation based on the quantile of two-group difference.
### Aliases: boundFinder

### ** Examples


	# Finding the 5% and 95% quantile of normal samples
	set.seed(0)
	mv <- cbind(rep(0,100000),rnorm(100000))
	boundFinder(mv)
	
	# Output matched the normal p-values
	#     5.0%     94.9% 
	#-1.639578  1.639691



