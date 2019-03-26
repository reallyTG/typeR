library(checkr)


### Name: check_missing_names
### Title: Check Missing Names
### Aliases: check_missing_names

### ** Examples

vec <- c(x = 1, y = 2, z = 0)
check_missing_names(vec, c("y", "x", "a"), error = FALSE)
check_missing_names(vec, "a", error = FALSE)



