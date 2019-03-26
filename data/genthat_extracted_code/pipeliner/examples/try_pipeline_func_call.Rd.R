library(pipeliner)


### Name: try_pipeline_func_call
### Title: Custom tryCatch configuration for pipeline segment segment
###   functions
### Aliases: try_pipeline_func_call

### ** Examples

## Not run: 
##D data <- data.frame(x = 1:3, y = 1:3 / 10)
##D f <- function(df) data.frame(p = df$x ^ 2, q = df$wrong)
##D try_pipeline_func_call(f, data, "f")
##D # Error in data.frame(p = df$x^2, q = df$wrong) :
##D #   arguments imply differing number of rows: 3, 0
##D # --> called from within function: f
## End(Not run)



