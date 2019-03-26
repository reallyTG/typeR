library(tester)


### Name: has_missing
### Title: Has missing values, NA, NaN, Inf
### Aliases: has_Inf has_NA has_NaN has_infinite has_missing has_nas
###   has_not_a_number

### ** Examples

has_missing(1:5) # FALSE
has_missing(c(1, 2, 3, 4, NA)) # TRUE

has_infinite(c(1, 2, Inf, 1/0))
has_infinite(c(-Inf, "infinite"))

has_not_a_number(c(1, 2, 3)) # FALSE
has_not_a_number(c(1, 0/0, 3)) # TRUE
has_not_a_number(c(NaN, pi, log(1))) # TRUE



