library(tester)


### Name: is_scalar
### Title: Is scalar
### Aliases: is_negative_scalar is_not_scalar is_positive_scalar is_scalar

### ** Examples

is_scalar(1)  # TRUE
is_scalar(pi)  # TRUE
is_scalar(1:5)  # FALSE
is_scalar(matrix(runif(4), 2, 2))  # FALSE

is_not_scalar(1:5)  # TRUE
is_not_scalar(NULL)  # TRUE
is_not_scalar(matrix(runif(4), 2, 2))  # TRUE

is_positive_scalar(1.0)  # TRUE
is_positive_scalar(0)  # FALSE
is_positive_scalar(-10)  # FALSE
is_positive_scalar("hoskdflksfd")  # FALSE
is_positive_scalar(NA)  # FALSE

is_negative_scalar(-1)  # TRUE
is_negative_scalar(0)  # FALSE
is_negative_scalar(10)  # FALSE
is_negative_scalar("hoskdflksfd")  # FALSE
is_negative_scalar(NA)  # FALSE



