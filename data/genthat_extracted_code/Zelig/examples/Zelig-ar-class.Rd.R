library(Zelig)


### Name: Zelig-ar-class
### Title: Time-Series Model with Autoregressive Disturbance
### Aliases: Zelig-ar-class zar

### ** Examples

data(seatshare)
subset <- seatshare[seatshare$country == "UNITED KINGDOM",]
ts.out <- zelig(formula = unemp ~ leftseat, model = "ar", ts = "year", data = subset)
summary(ts.out)




