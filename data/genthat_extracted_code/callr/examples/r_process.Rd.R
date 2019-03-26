library(callr)


### Name: r_process
### Title: External R Process
### Aliases: r_process

### ** Examples

## Not run: 
##D ## List all options and their default values:
##D r_process_options()
##D 
##D ## Start an R process in the background, wait for it, get result
##D opts <- r_process_options(func = function() 1 + 1)
##D rp <- r_process$new(opts)
##D rp$wait()
##D rp$get_result()
## End(Not run)



