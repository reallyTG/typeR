library(unittest)


### Name: ok
### Title: The unittest package's workhorse function
### Aliases: ok

### ** Examples

  ## Not run: 
##D   ok(1==1, "1 equals 1")
##D   # ok - 1 equals 1
##D 
##D   ok(1==1)
##D   # ok - 1 == 1
##D 
##D   ok(1==2, "1 equals 2")
##D   # not ok - 1 equals 2
##D   # # Test returned non-TRUE value:
##D   # # [1] FALSE
##D 
##D   ok(all.equal(c(1,2),c(1,2)), "compare vectors")
##D   # ok - compare vectors
##D 
##D   fn <- function () stop("oops")
##D   ok(fn(), "something with a coding error")
##D   # not ok - something with a coding error
##D   # # Test resulted in error:
##D   # #  oops
##D   # # Whilst evaluating:
##D   # #  fn()
##D 
##D   ok(c("Some diagnostic", "messages"), "A failure with diagnostic messages")
##D   # not ok - A failure with diagnostic messages
##D   # # Test returned non-TRUE value:
##D   # # Some diagnostic
##D   # # messages
##D   
## End(Not run)



