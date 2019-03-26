library(generics)


### Name: coercion-time-difference
### Title: Time difference coercion
### Aliases: coercion-time-difference as.difftime as.difftime.default

### ** Examples

as.difftime(1:5, units = "secs")

as.difftime(c("01:55:22", "01:55:25"))

as.difftime("01", format = "%H")
as.difftime("01", format = "%H", units = "secs")




