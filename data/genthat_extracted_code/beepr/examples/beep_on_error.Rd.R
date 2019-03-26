library(beepr)


### Name: beep_on_error
### Title: Play a short sound if there is an error
### Aliases: beep_on_error

### ** Examples

# Play a "ping" sound if \code{expr} produces an error
beep_on_error(log("foo"))

# Stay silent if \code{expr} does not produce an error
beep_on_error(log(1))

## Not run: 
##D # Play the Wilhelm scream instead of a ping on error.
##D beep_on_error(runif("bar"), "wilhelm")
## End(Not run)




