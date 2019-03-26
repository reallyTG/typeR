library(unittest)


### Name: ok_group
### Title: Group associated unit tests
### Aliases: ok_group

### ** Examples

  ## Not run: 
##D   ok_group("Test addition", {
##D       ok(1 + 1 == 2, "Can add 1")
##D       ok(1 + 3 == 4, "Can add 3")
##D   })
##D   ok_group("Test subtraction", {
##D       ok(1 - 1 == 0, "Can subtract 1")
##D       ok(1 - 3 == -2, "Can subtract 3")
##D   })
##D   # # Test addition
##D   # ok - Can add 1
##D   # ok - Can add 3
##D   # # Test subtraction
##D   # ok - Can subtract 1
##D   # ok - Can subtract 3
##D 
##D   # Multiline group message 
##D   ok_group(c("Test multiplication", "but not division"),{
##D       ok(1 * 1 == 1, "Can multiply by 1")
##D       ok(2 * 3 == 6, "Can multiply by 3")
##D   })
##D   # # Test multiplication
##D   # # but not division
##D   # ok - Can multiply by 1
##D   # ok - Can multiply by 3
##D   
## End(Not run)



