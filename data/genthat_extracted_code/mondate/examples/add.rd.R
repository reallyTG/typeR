library(mondate)


### Name: add
### Title: Add numerics to mondates using day-of-month logic
### Aliases: add

### ** Examples

x <- mondate(0:12)
add(x, 1)             # The third date will the the 29th of March
x <- mondate.ymd(2013, 1:11, 15)
add(x, 1)             # Always the 15th of the month. Compare to ...
x + 1
stopifnot(add(x, 13, units = "months") == mondate.ymd(2014, 2:12, 15))




