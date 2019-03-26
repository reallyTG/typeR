library(caret)


### Name: rfeControl
### Title: Controlling the Feature Selection Algorithms
### Aliases: rfeControl
### Keywords: utilities

### ** Examples


  ## Not run: 
##D subsetSizes <- c(2, 4, 6, 8)
##D set.seed(123)
##D seeds <- vector(mode = "list", length = 51)
##D for(i in 1:50) seeds[[i]] <- sample.int(1000, length(subsetSizes) + 1)
##D seeds[[51]] <- sample.int(1000, 1)
##D 
##D set.seed(1)
##D rfMod <- rfe(bbbDescr, logBBB,
##D              sizes = subsetSizes,
##D              rfeControl = rfeControl(functions = rfFuncs,
##D                                      seeds = seeds,
##D                                      number = 50))
##D   
## End(Not run)




