library(swirl)


### Name: omnitest
### Title: Test for a correct expression, a correct value, or both.
### Aliases: omnitest

### ** Examples

## Not run: 
##D 
##D   # Test that a user has chosen a correct menu item
##D   #
##D   omnitest(correctVal='Men in a college dorm.')
##D    
##D   # Test that a user has entered a correct number at the
##D   # command line
##D   #
##D   omnitest(correctVal=19)
##D    
##D   # Test that a user has entered a particular command
##D   #
##D   omnitest('myVar <- c(3, 5, 7)')
##D    
##D   # Test that a user has entered a command which computes
##D   # a specific value but perhaps in a different manner 
##D   # than anticipated
##D   #
##D   omnitest('sd(x)^2', 5.95)
##D   #
##D   # If the user enters sd(x)*sd(x), rather than sd(x)^2, a notification
##D   # will be issued, but the test will not fail.
##D   
##D   # Test that a user has entered a command which computes
##D   # a specific value in a particular way
##D   #
##D   omnitest('sd(x)^2', 5.95, strict=TRUE)
##D   #
##D   # In this case, if the user enters sd(x)*sd(x) the test will fail.
##D   
##D   
## End(Not run)



