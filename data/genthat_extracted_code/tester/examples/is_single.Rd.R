library(tester)


### Name: is_single
### Title: Is single
### Aliases: is_single

### ** Examples

is_single("hoskdflksfd")  # TRUE
is_single("1.0")  # TRUE
is_single(1:5)  # FALSE
is_single(matrix(runif(4), 2, 2))  # FALSE



