library(creditr)


### Name: check_inputs
### Title: Check whether inputs from the data frame are valid.
### Aliases: check_inputs

### ** Examples

x <- data.frame(date = as.Date(c("2014-04-22", "2014-04-22")),
                currency = c("USD", "EUR"),
                tenor = c(5, 5),
                spread = c(120, 110),
                coupon = c(100, 100),
                recovery = c(0.4, 0.4),
                notional = c(1000000, 1000000))
x <- check_inputs(x)



