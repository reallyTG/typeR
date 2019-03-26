library(icd)


### Name: logical_to_binary
### Title: Encode 'TRUE' as 1, and 'FALSE' as 0 (integers)
### Aliases: logical_to_binary binary_to_logical
### Keywords: internal logical manip

### ** Examples

mat <- matrix(sample(c(TRUE, FALSE), size = 9, replace = TRUE), nrow = 3)
mat
icd:::logical_to_binary(mat)
icd:::binary_to_logical(icd:::logical_to_binary(mat))



