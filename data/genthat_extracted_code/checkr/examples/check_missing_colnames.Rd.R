library(checkr)


### Name: check_missing_colnames
### Title: Check Missing Colnames
### Aliases: check_missing_colnames

### ** Examples

data <- data.frame(x = 1, y = 2, z = 0)
check_missing_colnames(data, c("y", "x", "a"), error = FALSE)
check_missing_colnames(data, "a", error = FALSE)



