library(checkr)


### Name: check_names
### Title: Check Names
### Aliases: check_names

### ** Examples

vec <- c(x = 1, y = 2, z = 0)
check_names(vec, c("y", "x"), error = FALSE)
check_names(vec, c("y", "x"), exclusive = TRUE, error = FALSE)
check_names(vec, c("y", "x"), order = TRUE, error = FALSE)
check_names(vec, c("a"), error = FALSE)



