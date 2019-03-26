library(ttutils)


### Name: isInteger
### Title: Test For Integrity
### Aliases: isInteger

### ** Examples

# isInteger tests if the _value_ of a variable is an integer
# 'c' as opposed to 'list' coerces its arguments!
isInteger(c("test", 1, 2, 2.1))     # FALSE FALSE FALSE FALSE
isInteger(list("test", 1, 2, 2.1))  # FALSE TRUE TRUE FALSE

class(1L)  # integer
typeof(1L) # integer
class(1)   # numeric
typeof(1)  # double

# is.integer tests if the _class_ of a variable is 'integer'
is.integer(c("test", 1, 2))    # FALSE
is.integer(list("test", 1, 2)) # FALSE
is.integer(1)                  # FALSE
is.integer(1L)                 # TRUE 



