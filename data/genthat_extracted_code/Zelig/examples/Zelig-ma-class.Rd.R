library(Zelig)


### Name: Zelig-ma-class
### Title: Time-Series Model with Moving Average
### Aliases: Zelig-ma-class zma

### ** Examples

data(seatshare)
subset <- seatshare[seatshare$country == "UNITED KINGDOM",]
ts.out <- zelig(formula = unemp ~ leftseat, model = "ma", ts = "year", data = subset)
summary(ts.out)




