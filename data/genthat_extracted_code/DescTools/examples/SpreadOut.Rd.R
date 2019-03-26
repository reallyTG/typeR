library(DescTools)


### Name: SpreadOut
### Title: Spread Out a Vector of Numbers To a Minimum Interval
### Aliases: SpreadOut
### Keywords: misc

### ** Examples

SpreadOut(c(1, 3, 3, 3, 3, 5), 0.2)
SpreadOut(c(1, 2.5, 2.5, 3.5, 3.5, 5), 0.2)
SpreadOut(c(5, 2.5, 2.5, NA, 3.5, 1, 3.5, NA), 0.2)

# this will almost always invoke the brute force second pass
SpreadOut(rnorm(10), 0.5)



