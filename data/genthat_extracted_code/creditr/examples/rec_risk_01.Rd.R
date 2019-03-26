library(creditr)


### Name: rec_risk_01
### Title: Calculate Recovery Rate Changes
### Aliases: rec_risk_01

### ** Examples

x <- data.frame(date = c(as.Date("2014-04-22"), as.Date("2014-04-22")),
                currency = c("USD", "EUR"),
                tenor = c(5, 5),
                spread = c(120, 110),
                coupon = c(100, 100),
                recovery = c(0.4, 0.4),
                notional = c(10000000, 10000000),
                stringsAsFactors = FALSE)
rec_risk_01(x)



