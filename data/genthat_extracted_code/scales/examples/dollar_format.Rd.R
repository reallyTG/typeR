library(scales)


### Name: dollar_format
### Title: Currency formatter: round to nearest cent and display dollar
###   sign.
### Aliases: dollar_format dollar

### ** Examples

dollar_format()(c(-100, 0.23, 1.456565, 2e3))
dollar_format()(c(1:10 * 10))
dollar(c(100, 0.23, 1.456565, 2e3))
dollar(c(1:10 * 10))
dollar(10^(1:8))

usd <- dollar_format(prefix = "USD ")
usd(c(100, -100))

euro <- dollar_format(prefix = "", suffix = "\u20ac")
euro(100)

finance <- dollar_format(negative_parens = TRUE)
finance(c(-100, 100))



