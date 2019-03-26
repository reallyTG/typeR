library(ParallelLogger)


### Name: matchInList
### Title: In a list of object of the same type, find those that match the
###   input
### Aliases: matchInList

### ** Examples

x <- list(a = list(name = "John", age = 25, gender = "M"),
          b = list(name = "Mary", age = 24, gender = "F"))

matchInList(x, list(name = "Mary"))

# [[1]]
# [[1]]$name
# [1] "Mary"
# 
# [[1]]$age
# [1] 24




