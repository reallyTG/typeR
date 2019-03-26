library(MSEtool)


### Name: HCRlin
### Title: Generic linear harvest control rule based on biomass
### Aliases: HCRlin

### ** Examples

#40-10 linear ramp
Brel <- seq(0, 1, length.out = 200)
plot(Brel, HCRlin(Brel, 0.1, 0.4), xlab = "Estimated B/B0", ylab = "TAC adjustment factor",
main = "A 40-10 harvest control rule", type = 'l', col = 'blue')
abline(v = c(0.1,0.4), col = 'red', lty = 2)



