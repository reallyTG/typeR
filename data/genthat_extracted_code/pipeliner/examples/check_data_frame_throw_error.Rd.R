library(pipeliner)


### Name: check_data_frame_throw_error
### Title: Validate ml_pipeline_builder transform method returns data.frame
### Aliases: check_data_frame_throw_error

### ** Examples

## Not run: 
##D transform_method <- function(df) df
##D data <- data.frame(y = c(1, 2), x = c(0.1, 0.2))
##D data_transformed <- transform_method(data)
##D check_data_frame_throw_error(data_transformed, "transform_method")
##D # NULL
## End(Not run)



