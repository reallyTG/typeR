library(NMOF)


### Name: xtContractValue
### Title: Contract Value of Australian Government Bond Future
### Aliases: xtContractValue xtTickValue

### ** Examples

quoted.price <- 99
coupon <- 6
xtContractValue(quoted.price, coupon)
xtTickValue(quoted.price, coupon)
## convexity
quoted.price <- seq(90, 100, by = 0.1)
plot(100 - quoted.price,
     xtContractValue(quoted.price, coupon),
     xlab = "Yield", ylab = "Contract value")



