library(pdmod)


### Name: isTimedVector
### Title: Is TimedVector
### Aliases: isTimedVector

### ** Examples

# A TimedVector
tv = TimedVector(rep(1, 10), 1:10)
isTimedVector(tv)

# Not a TimedVector
isTimedVector(1:10)
isTimedVector(time(tv))



