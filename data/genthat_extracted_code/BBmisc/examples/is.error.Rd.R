library(BBmisc)


### Name: is.error
### Title: Is return value of try an exception?
### Aliases: is.error

### ** Examples

x = try(stop("foo"))
print(is.error(x))
x = 1
print(is.error(x))



