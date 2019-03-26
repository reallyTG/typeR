library(synchronicity)


### Name: is.timed, timeout
### Title: Timeout operations for boost.mutex objects
### Aliases: is.timed timeout
### Keywords: programming misc

### ** Examples

x = boost.mutex(timeout=5)
y = boost.mutex()
print(is.timed(x))
print(is.timed(y))
print(timeout(x))
print(timeout(y))



