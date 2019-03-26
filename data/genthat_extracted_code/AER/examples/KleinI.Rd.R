library(AER)


### Name: KleinI
### Title: Klein Model I
### Aliases: KleinI
### Keywords: datasets

### ** Examples

data("KleinI", package = "AER")
plot(KleinI)

## Greene (2003), Tab. 15.3, OLS
library("dynlm")
fm_cons <- dynlm(consumption ~ cprofits + L(cprofits) + I(pwage + gwage), data = KleinI)
fm_inv <- dynlm(invest ~ cprofits + L(cprofits) + capital, data = KleinI)
fm_pwage <- dynlm(pwage ~ gnp + L(gnp) + I(time(gnp) - 1931), data = KleinI)
summary(fm_cons)
summary(fm_inv)
summary(fm_pwage)

## More examples can be found in:
## help("Greene2003")



