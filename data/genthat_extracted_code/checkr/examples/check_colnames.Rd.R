library(checkr)


### Name: check_colnames
### Title: Check Colnames
### Aliases: check_colnames

### ** Examples

data <- data.frame(x = 1, y = 2, z = 0)
check_colnames(data, c("y", "x"), error = FALSE)
check_colnames(data, c("y", "x"), exclusive = TRUE, error = FALSE)
check_colnames(data, c("y", "x"), order = TRUE, error = FALSE)
check_colnames(data, c("a"), error = FALSE)



