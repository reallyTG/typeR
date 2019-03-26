library(oce)


### Name: fillGap
### Title: Fill a gap in an oce object
### Aliases: fillGap

### ** Examples

library(oce)
# Integers
x <- c(1:2, NA, NA, 5:6)
y <- fillGap(x)
print(data.frame(x,y))
# Floats
x <- x + 0.1
y <- fillGap(x)
print(data.frame(x,y))



