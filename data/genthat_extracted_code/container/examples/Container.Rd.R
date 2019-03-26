library(container)


### Name: Container
### Title: A sequence container
### Aliases: Container
### Keywords: datasets

### ** Examples

c0 <- Container$new()
c0$size()                            # 0
c0$add(1)
c0$add(2)$add("A")                   # chaining example
c0$has(2)                            # TRUE
c0$discard(2)$has(2)                 # FALSE

## Not run: 
##D c0$remove(2)                         # Error : 2 not in Container
## End(Not run)
c0$discard(2)$has(2)                 # still FALSE, but no error

# Container types
Container$new(list("A", 1))$type()   # "list"
Container$new(numeric(0))$type()     # "double"
Container$new(0+0i)$type()           # "complex"
Container$new(letters[1:3])$type()   # "character"
Container$new(letters[1:3])$values() # "a" "b" "c"
Container$new(1L)$type()             # "integer"
Container$new(1L)$add(2.3)$values()  # since integer type, equals c(1, 2)



