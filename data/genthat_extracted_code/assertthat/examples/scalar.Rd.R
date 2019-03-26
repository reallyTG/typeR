library(assertthat)


### Name: scalar
### Title: Assert input is a scalar.
### Aliases: is.scalar is.string is.number is.flag is.count

### ** Examples

# Generic check for scalars
see_if(is.scalar("a"))
see_if(is.scalar(1:10))

# string = scalar character vector
see_if(is.string(1:3))
see_if(is.string(c("a", "b")))
see_if(is.string("x"))

# number = scalar numeric/integer vector
see_if(is.number(1:3))
see_if(is.number(1.5))

# flag = scalar logical vector
see_if(is.flag(1:3))
see_if(is.flag("a"))
see_if(is.flag(c(FALSE, FALSE, TRUE)))
see_if(is.flag(FALSE))

# count = scalar positive integer
see_if(is.count("a"))
see_if(is.count(-1))
see_if(is.count(1:5))
see_if(is.count(1.5))
see_if(is.count(1))




