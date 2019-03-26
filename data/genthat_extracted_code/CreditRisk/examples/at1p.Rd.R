library(CreditRisk)


### Name: at1p
### Title: Analytically - Tractable First Passage (AT1P) model
### Aliases: at1p

### ** Examples

mod <- at1p(V0 = 1, H0 = 0.7, B = 0.4, sigma = rep(0.1, 10), r = cdsdata$ED.Zero.Curve,
t = cdsdata$Maturity)
mod

plot(cdsdata$Maturity, mod$Ht, type = 'b', xlab = 'Maturity', ylab = 'Safety Level H(t)',
main = 'Safety level for different maturities', ylim = c(min(mod$Ht), 1.5),
col = 'red')
lines(cdsdata$Maturity, mod$Vt, xlab = 'Maturity', ylab = 'V(t)',
main = 'Value of the Firm \n at time t', type = 's')

plot(cdsdata$Maturity, mod$Survival, type = 'b',
main = 'Survival Probability for different Maturity \n (AT1P model)',
xlab = 'Maturity', ylab = 'Survival Probability')

matplot(cdsdata$Maturity, mod$Default.Intensity, type = 'l', xlab = 'Maturity',
ylab = 'Default Intensity')




