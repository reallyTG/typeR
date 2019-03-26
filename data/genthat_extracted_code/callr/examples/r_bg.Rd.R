library(callr)


### Name: r_bg
### Title: Evaluate an expression in another R session, in the background
### Aliases: r_bg

### ** Examples

## Not run: 
##D rx <- r_bg(function() 1 + 2)
##D 
##D # wait until it is done
##D rx$wait()
##D rx$is_alive()
##D rx$get_result()
## End(Not run)



