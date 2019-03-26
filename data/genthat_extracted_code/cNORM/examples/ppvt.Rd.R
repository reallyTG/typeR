library(cNORM)


### Name: ppvt
### Title: Vocabulary development from 4 to 16
### Aliases: ppvt
### Keywords: datasets

### ** Examples

## Not run: 
##D # Example with continuous age variable
##D data.ppvt <- rankBySlidingWindow(ppvt, age="age", width=1.5)
##D data.ppvt <- computePowers(data.ppvt, age="age")
##D model.ppvt <- bestModel(data.ppvt, R2 = .994)
##D 
##D # plot information function
##D plotSubset(model.ppvt, type=2)
##D 
##D # check model consistency
##D checkConsistency(model.ppvt)
##D 
##D # plot percentiles
##D plotPercentiles(data.ppvt, model.ppvt)
## End(Not run)



