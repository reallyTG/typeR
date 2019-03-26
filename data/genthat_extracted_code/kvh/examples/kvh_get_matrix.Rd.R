library(kvh)


### Name: kvh_get_matrix
### Title: Get matrix from kvh file
### Aliases: kvh_get_matrix

### ** Examples

# write a test matrix
obj2kvh(list(comment="this is a test matrix",  m=diag(2)), "li", "test.kvh")
# read it back
mr=kvh_get_matrix(file("test.kvh"), c("li", "m"))




