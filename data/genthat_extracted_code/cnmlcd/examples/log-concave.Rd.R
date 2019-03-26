library(cnmlcd)


### Name: log-concave
### Title: The Log-concave Distribution.
### Aliases: log-concave dlcd plcd

### ** Examples

x = rnorm(1000)
r = cnmlcd(x)
dlcd(-4:4, r$lcd)
dlcd(-4:4, r$lcd, log=TRUE)
plcd(-4:4, r$lcd)
plcd(-4:4, r$lcd, lower.tail = FALSE)



