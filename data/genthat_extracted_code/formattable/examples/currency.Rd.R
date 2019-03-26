library(formattable)


### Name: currency
### Title: Numeric vector with currency format
### Aliases: currency currency.character currency.default

### ** Examples

currency(200000)
currency(200000, "\U20AC")
currency(1200000, "USD", sep = " ")
currency(1200000, "USD", format = "d", sep = " ")
currency("$ 120,250.50")
currency("HK$ 120,250.50", symbol = "HK$")
currency("HK$ 120, 250.50")



