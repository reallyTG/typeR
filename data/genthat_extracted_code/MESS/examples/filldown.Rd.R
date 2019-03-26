library(MESS)


### Name: filldown
### Title: Fill down NA with the last observed observation
### Aliases: filldown

### ** Examples


a <- c(1:5, "Howdy", NA, NA, 2:3, NA)
filldown(a)
filldown(c(NA, NA, NA, 3:5))




