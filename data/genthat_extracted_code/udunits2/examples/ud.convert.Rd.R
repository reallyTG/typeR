library(udunits2)


### Name: ud.convert
### Title: Convert numeric types from one unit to another
### Aliases: ud.convert

### ** Examples

x <- seq(10)
ud.convert(x, "miles", "km")                   # c(1.609344, 3.218688, 4.828032, ...)
x <- c(-40, 0, 100)
ud.convert(x, "celsius", "degree_fahrenheit")  # c(-40, 32, 212)
err <- try(ud.convert(100,"miles", "grams"))   # Error
err <- try(ud.convert(NA, "not", "parseable")) # Error



