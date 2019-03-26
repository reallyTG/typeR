library(checkr)


### Name: check_nrow
### Title: Check Number of Rows
### Aliases: check_nrow

### ** Examples

check_nrow(data.frame(x = 1), error = FALSE)
check_nrow(data.frame(x = integer(0)), error = FALSE)
check_nrow(data.frame(x = 1:2), nrow = 1, error = FALSE)



