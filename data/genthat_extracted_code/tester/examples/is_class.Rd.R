library(tester)


### Name: is_class
### Title: Is class
### Aliases: is_class

### ** Examples

is_class("test_me", "character") # TRUE
is_class(1:10, "numeric") # TRUE

y = 'hello'
class(y) = "hello"
is_class(y, 'hello')



