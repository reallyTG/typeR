library(fxregime)


### Name: FXRatesCHF
### Title: Exchange Rates with CHF Unit Currency
### Aliases: FXRatesCHF
### Keywords: datasets

### ** Examples

data("FXRatesCHF")
## compute/visualize USD/CNY rate
cny_usd <- na.trim(FXRatesCHF[,"CNY"]/FXRatesCHF[,"USD"])
plot(cny_usd)



