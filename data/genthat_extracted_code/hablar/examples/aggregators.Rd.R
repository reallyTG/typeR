library(hablar)


### Name: wrapper - s and summary funs
### Title: Combine aggregate function and s
### Aliases: 'wrapper - s and summary funs' max_ sum_ min_ mean_ first_

### ** Examples

## sum_ on non-rational numeric vector
vector <- c(7, NaN, -Inf, 4)
sum_(vector)

## Min of vector with length 0
vector <- c()
# With a wrapped s
min_(vector)

## Max of vector with only NA
# With a wrapped s
max_(vector)

## Use of s when NA should not be removes
vector <- c(7, Inf, NA, 4)
# With a wrapped s
sum_(vector, ignore_na = FALSE)




