library(ParallelLogger)


### Name: selectFromList
### Title: Select variables from a list of objects of the same type
### Aliases: selectFromList

### ** Examples


x <- list(a = list(name = "John", age = 25, gender = "M"),
          b = list(name = "Mary", age = 24, gender = "F"))
selectFromList(x, c("name", "age"))

# $a
# $a$name
# [1] "John"
# 
# $a$age
# [1] 25
# 
# 
# $b
# $b$name
# [1] "Mary"
# 
# $b$age
# [1] 24




