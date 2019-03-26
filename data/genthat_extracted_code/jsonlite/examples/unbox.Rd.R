library(jsonlite)


### Name: unbox
### Title: Unbox a vector or data frame
### Aliases: unbox

### ** Examples

toJSON(list(foo=123))
toJSON(list(foo=unbox(123)))

# Auto unbox vectors of length one:
x = list(x=1:3, y = 4, z = "foo", k = NULL)
toJSON(x)
toJSON(x, auto_unbox = TRUE)

x <- iris[1,]
toJSON(list(rec=x))
toJSON(list(rec=unbox(x)))



