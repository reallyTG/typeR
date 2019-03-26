library(CreditRisk)


### Name: Merton
### Title: Merton's model
### Aliases: Merton

### ** Examples

mod <- Merton(L = 10, V0 = 20, sigma = 0.2, r = 0.005,
              t = c(0.50, 1.00, 2.00, 3.25, 5.00, 10.00, 15.00, 20.00))
mod

plot(c(0.50, 1.00, 2.00, 3.25, 5.00, 10.00, 15.00, 20.00), mod$Surv,
     main = 'Survival Probability for different Maturity \n (Merton model)',
     xlab = 'Maturity', ylab = 'Survival Probability', type = 'b')



