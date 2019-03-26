library(tester)


### Name: same_nrow
### Title: Same Number of Rows / Columns
### Aliases: different_ncol different_nrow same_ncol same_nrow

### ** Examples

a = matrix(1:15, 5, 3)

same_nrow(a, a) # TRUE
same_nrow(a, t(a)) # FALSE
same_ncol(a, a) # TRUE
same_ncol(a, t(a)) # FALSE

different_nrow(a, a) # FALSE
different_nrow(a, t(a)) # TRUE
different_ncol(a, a) # FALSE
different_ncol(a, t(a)) # TRUE



