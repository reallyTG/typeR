library(TreeBUGS)


### Name: getParam
### Title: Get Parameter Posterior Statistics
### Aliases: getParam

### ** Examples

## Not run: 
##D # mean estimates per person:
##D getParam(fittedModel, parameter = "theta")
##D 
##D # save summary of individual estimates:
##D getParam(fittedModel, parameter = "theta",
##D          stat = "summary", file= "ind_summ.csv")
## End(Not run)




