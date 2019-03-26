library(radiant.data)


### Name: is_empty
### Title: Is a character variable defined
### Aliases: is_empty

### ** Examples

is_empty("")
is_empty(NULL)
is_empty(NA)
is_empty(c())
is_empty("none", empty = "none")
is_empty("")
is_empty("   ")
is_empty(" something  ")
is_empty(c("", "something"))
is_empty(c(NA, 1:100))
is_empty(mtcars)




