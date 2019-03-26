library(container)


### Name: Set
### Title: A Set class
### Aliases: Set
### Keywords: datasets

### ** Examples

s1 <- Set$new()$add("A")
s1$values()                     # "A"
s1$add(2)$add("A")$values()     # "A" 2
s1$remove("A")$values()         # 2

#' \dontrun{
#' s1$remove(3)              # Error: 3 not in Set
#' }



