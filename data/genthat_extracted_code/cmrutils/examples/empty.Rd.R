library(cmrutils)


### Name: empty
### Title: Helper Routine
### Aliases: empty
### Keywords: utilities

### ** Examples

  empty(0)
  empty(1:10)
  empty(matrix(1:4, 2, 2))
  empty(array(1:24, dim = c(2, 3, 4)))

  empty(list(a = 1, b = 2))
  empty(data.frame(a = 1:2, b = 3:4))

  empty(ts(1:10, frequency = 5))



