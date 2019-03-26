library(rlang)


### Name: op-get-attr
### Title: Infix attribute accessor and setter
### Aliases: op-get-attr %@% %@%<-

### ** Examples

# Unlike `@`, this operator extracts attributes for any kind of
# objects:
factor(1:3) %@% "levels"
mtcars %@% class

mtcars %@% class <- NULL
mtcars

# It also works on S4 objects:
.Person <- setClass("Person", slots = c(name = "character", species = "character"))
fievel <- .Person(name = "Fievel", species = "mouse")
fievel %@% name



