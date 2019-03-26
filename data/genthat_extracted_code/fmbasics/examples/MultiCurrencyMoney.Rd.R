library(fmbasics)


### Name: MultiCurrencyMoney
### Title: MultiCurrencyMoney
### Aliases: MultiCurrencyMoney

### ** Examples

mcm <- MultiCurrencyMoney(list(
  SingleCurrencyMoney(1, AUD()),
  SingleCurrencyMoney(2, USD())
))
rbind(mcm, mcm)



