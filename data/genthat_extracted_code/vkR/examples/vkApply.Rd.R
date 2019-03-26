library(vkR)


### Name: vkApply
### Title: Apply a method over a vector of objects
### Aliases: vkApply

### ** Examples

## Not run: 
##D  users <- vkApply(c("",1234567), function(user) getUsers(user, fields="sex"))
##D  countries <- vkApply(c(2,5122182,1906578), getCountryByCityId)
## End(Not run)



