library(CreditRisk)


### Name: BlackCox
### Title: Black and Cox's model
### Aliases: BlackCox

### ** Examples

mod <- BlackCox(L = 0.55, K = 0.40, V0 = 1, sigma = 0.3, r = 0.05, gamma = 0.04,
t = c(0.50, 1.00, 2.00, 5.00, 7.00, 10.00, 20.00, 30.00))
mod

plot(c(0.50, 1.00, 2.00, 5.00, 7.00, 10.00, 20.00, 30.00), mod$Ht, type = 'b',
     xlab = 'Maturity', ylab = 'Safety Level H(t)', main = 'Safety level for different
     maturities', ylim = c(min(mod$Ht), 1.5), col = 'red')
abline(h = 0.55, col = 'red')
lines(c(0.50, 1.00, 2.00, 5.00, 7.00, 10.00, 20.00, 30.00), mod$Vt, xlab = 'Maturity',
      ylab = 'V(t)', main = 'Value of the Firm \n at time t', type = 's')

plot(c(0.50, 1.00, 2.00, 5.00, 7.00, 10.00, 20.00, 30.00), mod$Survival, type = 'b',
     main = 'Survival Probability for different Maturity \n (Black & Cox model)',
     xlab = 'Maturity', ylab = 'Survival Probability')

matplot(c(0.50, 1.00, 2.00, 5.00, 7.00, 10.00, 20.00, 30.00), mod$Default.Intensity,
        type = 'l', xlab = 'Maturity', ylab = 'Default Intensity')




