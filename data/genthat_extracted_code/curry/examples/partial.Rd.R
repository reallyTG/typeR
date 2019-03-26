library(curry)


### Name: partial
### Title: Apply arguments partially to a function
### Aliases: %><% partial

### ** Examples

dummy_lengths <- vapply %><% list(FUN = length, FUN.VALUE = integer(1))
test_list <- list(a = 1:5, b = 1:10)
dummy_lengths(test_list)




