library(optiRum)


### Name: pounds_format
### Title: Currency formatter: round to nearest penny and display pounds
###   sign.
### Aliases: pounds_format pounds

### ** Examples

pounds_format()(c(100, 0.23, 1.456565, 2e3))
pounds_format()(c(1:10 * 10))
pounds(c(100, 0.23, 1.456565, 2e3))
pounds(c(1:10 * 10))
pounds(10^(1:8))



