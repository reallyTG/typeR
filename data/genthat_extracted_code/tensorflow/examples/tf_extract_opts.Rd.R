library(tensorflow)


### Name: tf_extract_opts
### Title: Tensor extract options
### Aliases: tf_extract_opts

### ** Examples

## Not run: 
##D x <- tf$constant(1:10)
##D 
##D opts <-  tf_extract_opts("R")
##D x[1, options = opts]
##D 
##D # or for more fine-grained control
##D opts <- tf_extract_opts(
##D     one_based = FALSE,
##D     warn_tensors_passed_asis = FALSE,
##D     warn_negatives_pythonic = FALSE
##D )
##D x[0:2, options = opts]
## End(Not run)



