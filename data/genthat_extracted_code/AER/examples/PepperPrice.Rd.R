library(AER)


### Name: PepperPrice
### Title: Black and White Pepper Prices
### Aliases: PepperPrice
### Keywords: datasets

### ** Examples

## data
data("PepperPrice")
plot(PepperPrice, plot.type = "single", col = 1:2)

## package
library("tseries")
library("urca")

## unit root tests
adf.test(log(PepperPrice[, "white"]))
adf.test(diff(log(PepperPrice[, "white"])))
pp.test(log(PepperPrice[, "white"]), type = "Z(t_alpha)")
pepper_ers <- ur.ers(log(PepperPrice[, "white"]),
  type = "DF-GLS", model = "const", lag.max = 4)
summary(pepper_ers)

## stationarity tests
kpss.test(log(PepperPrice[, "white"]))

## cointegration
po.test(log(PepperPrice))
pepper_jo <- ca.jo(log(PepperPrice), ecdet = "const", type = "trace")
summary(pepper_jo)
pepper_jo2 <- ca.jo(log(PepperPrice), ecdet = "const", type = "eigen")
summary(pepper_jo2)



