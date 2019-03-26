library(tableschema.r)


### Name: types.castInteger
### Title: Cast integer
### Aliases: types.castInteger

### ** Examples

types.castInteger(format = "default", value = 1)

types.castInteger(format = "default", value = "1")
# cast trailing non numeric character
types.castInteger(format = "default", value = "1$", options = list(bareNumber = FALSE))




