library(creditr)


### Name: spread_DV01
### Title: Calculate Spread Change
### Aliases: spread_DV01

### ** Examples

x <- data.frame(date = c(as.Date("2014-04-22"), as.Date("2014-04-22")),
                currency = c("USD", "EUR"),
                tenor = c(5, 5),
                spread = c(120, 110),
                coupon = c(100, 100),
                recovery = c(0.4, 0.4),
                notional = c(10000000, 10000000),
                stringsAsFactors = FALSE)
spread_DV01(x)



