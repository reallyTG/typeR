library(FSA)


### Name: oddeven
### Title: Determine if a number is odd or even.
### Aliases: oddeven is.odd is.even
### Keywords: manip

### ** Examples

## Individual values
is.odd(1)
is.odd(2)
is.even(3)
is.even(4)

## Vector of values
d <- 1:8
data.frame(d,odd=is.odd(d),even=is.even(d))



