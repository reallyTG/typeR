library(CreditRisk)


### Name: sbtv
### Title: Scenario Barrier Time-Varying Volatility AT1P model
### Aliases: sbtv

### ** Examples

mod <- sbtv(V0 = 1, H = c(0.4, 0.8), p = c(0.95, 0.05), B = 0, sigma = rep(0.20, 10),
            r = cdsdata$ED.Zero.Curve, t = cdsdata$Maturity)
mod

plot(cdsdata$Maturity, mod$Survival, type = 'b')




