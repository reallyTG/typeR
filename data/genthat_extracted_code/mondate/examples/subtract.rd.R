library(mondate)


### Name: subtract
### Title: Subtract numerics from mondates using day-of-month logic
### Aliases: subtract

### ** Examples

x <- mondate(0:12)
subtract(x, 1)             # The third date will the the 29th of March
x <- mondate.ymd(2013, 2:12, 15)
subtract(x, 1)             # Always the 15th of the month. Compare to ...
x - 1
stopifnot(subtract(x, 1, units = "months") == mondate.ymd(2013, 1:11, 15))




