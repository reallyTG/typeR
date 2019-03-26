library(R.oo)


### Name: hasField.Object
### Title: Checks if a field exists or not
### Aliases: hasField.Object Object.hasField hasField,Object-method
### Keywords: programming methods internal methods

### ** Examples

  obj <- Object()
  obj$x <- 1:100
  obj$y <- 100:1
  hasField(obj, c("x", "a", "b", "y"))

  ## Not run: 
##D   gives:
##D 
##D   [1] TRUE FALSE FALSE TRUE
##D   
## End(Not run)



