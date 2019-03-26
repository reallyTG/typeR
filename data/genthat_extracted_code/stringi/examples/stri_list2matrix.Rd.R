library(stringi)


### Name: stri_list2matrix
### Title: Convert a List to a Character Matrix
### Aliases: stri_list2matrix

### ** Examples

simplify2array(list(c("a", "b"), c("c", "d"), c("e", "f")))
stri_list2matrix(list(c("a", "b"), c("c", "d"), c("e", "f")))
stri_list2matrix(list(c("a", "b"), c("c", "d"), c("e", "f")), byrow=TRUE)

simplify2array(list("a", c("b", "c")))
stri_list2matrix(list("a", c("b", "c")))
stri_list2matrix(list("a", c("b", "c")), fill="")
stri_list2matrix(list("a", c("b", "c")), fill="", n_min=5)




