library(apTreeshape)


### Name: shift.test
### Title: Testing diversification rate variation in phylogenetic trees
### Aliases: shift.test
### Keywords: htest

### ** Examples

	## Detecting diversification rate variation in bird families (135 tips)
 data(bird.families)
 tree.birds <- as.treeshape(bird.families, model = "yule")
 class(tree.birds) <- "treeshape"
 pv <- sapply(1:135, FUN = function(i) shift.test(tree.birds, i, lambda1 = 1, 
                                      lambda2 = 100, nrep = 1000, silent = TRUE))

	## Significant shifts detected at nodes = 67 and 78	
 pv[c(67,78)]
 shift.test(tree.birds, node = 67, lambda1 = 1, lambda2 = 100, nrep = 10000, silent = TRUE)
 shift.test(tree.birds, node = 78, lambda1 = 1, lambda2 = 100, nrep = 10000, silent = TRUE)

 	## visualize the shifts
 par(mfrow=c(2,1)) 
 plot(cutreeshape(tree.birds, ancestor(tree.birds, 67) , "bottom"))
 plot(cutreeshape(tree.birds, 78 , "bottom"))




