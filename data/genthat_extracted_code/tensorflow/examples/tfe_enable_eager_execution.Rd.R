library(tensorflow)


### Name: tfe_enable_eager_execution
### Title: Enables, for the rest of the lifetime of this program, eager
###   execution.
### Aliases: tfe_enable_eager_execution

### ** Examples

## Not run: 
##D 
##D # load tensorflow and enable eager execution
##D library(tensorflow)
##D tfe_enable_eager_execution()
##D 
##D # create a random 10x10 matrix
##D x <- tf$random_normal(shape(10, 10))
##D 
##D # use it in R via as.matrix()
##D heatmap(as.matrix(x))
## End(Not run)




