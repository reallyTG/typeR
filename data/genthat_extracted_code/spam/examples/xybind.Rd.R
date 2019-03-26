library(spam)


### Name: cbind
### Title: Combine spam Matrices by Rows or Columns
### Aliases: cbind.spam rbind.spam cbind rbind cbind,spam-method
###   rbind,spam-method
### Keywords: array manip

### ** Examples

x <- cbind.spam(1:5,6)

y <- cbind(x, 7)

rbind( x, x)
# for some large matrices   t( cbind( t(x), t(x)))
# might be slightly faster:





