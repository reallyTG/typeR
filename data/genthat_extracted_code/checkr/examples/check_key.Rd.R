library(checkr)


### Name: check_key
### Title: Check Key
### Aliases: check_key

### ** Examples

data <- data.frame(x = 1:1, y = 1:2)
check_key(data, "x", error = FALSE)
check_key(data, c("y", "x"), error = FALSE)



