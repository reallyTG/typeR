library(checkr)


### Name: check_join
### Title: Check Join
### Aliases: check_join

### ** Examples

data1 <- data.frame(x = 1:2)
data2 <- data.frame(x = 3:5, y = 2L)
check_join(data1, data2, error = FALSE)
check_join(data1, data2, by = c(x = "y"), error = FALSE)



