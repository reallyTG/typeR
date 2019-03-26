library(Zelig)


### Name: Zelig-arima-class
### Title: Autoregressive and Moving-Average Models with Integration for
###   Time-Series Data
### Aliases: Zelig-arima-class zarima

### ** Examples

data(seatshare)
subset <- seatshare[seatshare$country == "UNITED KINGDOM",]
ts.out <- zarima$new()
ts.out$zelig(unemp ~ leftseat, order = c(1, 0, 1), data = subset)

# Set fitted values and simulate quantities of interest
ts.out$setx(leftseat = 0.75)
ts.out$setx1(leftseat = 0.25)
ts.out$sim()




