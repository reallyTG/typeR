library(pipeliner)


### Name: process_transform_throw_error
### Title: Validate and clean transform function output
### Aliases: process_transform_throw_error

### ** Examples

## Not run: 
##D transform_method <- function(df) cbind_fast(df, q = df$y * df$y)
##D data <- data.frame(y = c(1, 2), x = c(0.1, 0.2))
##D data_transformed <- transform_method(data)
##D process_transform_throw_error(data, data_transformed, "transform_method")
##D # transform_method yields data.frame that duplicates input vars - dropping the following
##D columns: 'y', 'x'
##D # q
##D # 1 1
##D # 2 4
## End(Not run)



