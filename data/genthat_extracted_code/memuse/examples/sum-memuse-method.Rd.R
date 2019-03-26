library(memuse)


### Name: sum,memuse-method
### Title: memuse Arithmetic
### Aliases: sum,memuse-method
### Keywords: Methods

### ** Examples

## Not run: 
##D x = mu(2000)
##D y = mu(5000)
##D 
##D sum(x, y)
##D 
##D ### Mixing numeric and memuse objects will work, but the first one must be a
##D ### memuse object.
##D sum(mu(10), 10) # This will work
##D sum(10, mu(10)) # This will not
## End(Not run)




