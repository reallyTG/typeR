library(R.oo)


### Name: getFields.Object
### Title: Returns the field names of an Object
### Aliases: getFields.Object Object.getFields getFields,Object-method
###   Object.names names.Object names,Object-method
### Keywords: programming methods internal methods

### ** Examples

  obj <- Object()
  obj$x <- 1:100
  obj$y <- 100:1
  getFields(obj)

  ## Not run: 
##D   gives:
##D 
##D   [1] "x" "y"
##D   
## End(Not run)



