library(rebus.numbers)


### Name: number_range
### Title: Generate a regular expression for a number range.
### Aliases: number_range

### ** Examples

number_range(0, 255)
number_range(0, 255, allow_leading_zeroes = TRUE)
number_range(10000, 19999)
number_range(6, 54321)
number_range(-77, 77)
number_range(-77, 77, capture = TRUE)
number_range(-77, 77, capture = NA)



